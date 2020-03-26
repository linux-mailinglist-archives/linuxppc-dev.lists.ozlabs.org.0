Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A38193864
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 07:13:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nvn81PrjzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 17:13:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nvl2592szDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 17:11:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iDa+zXA4; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48nvl236Ytz9sSH; Thu, 26 Mar 2020 17:11:42 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48nvl20hVvz9sSJ; Thu, 26 Mar 2020 17:11:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585203102;
 bh=9ZAIL4NpEHG0R/pyhsRRrSV1xFtqEYpMT+zHcV+GOvI=;
 h=From:To:Cc:Subject:Date:From;
 b=iDa+zXA4fYvx6FlmSvygj2USMzauhzzwRbxXBdfVmXS2jDWpFPxg2PuhlsrbWj0Wl
 sOY+XX16YyBoPm4Q/K8sm8xrm6y3z4nPPDu2EHGNgmRGStDzRcHTS7WbX9ezBa+Wdk
 481nTKJNkb73nOmC05ojgWaj5bv1zV1ce0yiTPuXekvqPjSif5rYzOn7nKdC5SPMyS
 e4Z37vCbK33HfppiQeQ0BflArJ5VtjoqVTGjytLIWFPSRL3Z5MV6C8GbNpcLVEWjoL
 XvOrw7Qy5fiYV/yVSOTj7A0NxYA7pbvnegvDdGHCq/BikkyQmCDH/yB4CqFHX/QSUA
 B25nGUOLLMsMg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/eeh: Skip ahci adapters
Date: Thu, 26 Mar 2020 17:11:44 +1100
Message-Id: <20200326061144.2006522-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: oohall@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ahci driver doesn't support error recovery, and if your root
filesystem is attached to it the eeh-basic.sh test will likely kill
your machine.

So skip any device we see using the ahci driver.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/eeh/eeh-basic.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
index f988d2f42e8f..8a8d0f456946 100755
--- a/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
+++ b/tools/testing/selftests/powerpc/eeh/eeh-basic.sh
@@ -41,6 +41,11 @@ for dev in `ls -1 /sys/bus/pci/devices/ | grep '\.0$'` ; do
 		continue;
 	fi
 
+	if [ "ahci" = "$(basename $(realpath /sys/bus/pci/devices/$dev/driver))" ] ; then
+		echo "$dev, Skipped: ahci doesn't support recovery"
+		continue
+	fi
+
 	# Don't inject errosr into an already-frozen PE. This happens with
 	# PEs that contain multiple PCI devices (e.g. multi-function cards)
 	# and injecting new errors during the recovery process will probably

base-commit: 11a48a5a18c63fd7621bb050228cebf13566e4d8
prerequisite-patch-id: 2d4d04fc1422098aacadc8743efec84d3929bc0b
prerequisite-patch-id: 6063d411906b0b6f41dfce6cfd3f4795f25e9c11
prerequisite-patch-id: 20393e4806e464b171d542d3de4e41bbba07d521
prerequisite-patch-id: b1c3d27aaaeca2b94cab75a82008db7e4d3fc9f4
prerequisite-patch-id: 721316c5f0021ac0dbc4d03f68c21a77eef88d08
prerequisite-patch-id: 69a161a8f9f2175cce8b4a62c0e86b4bbdab5f10
prerequisite-patch-id: e47c4610cf53f8a30fb4a3541751292dec47a1c9
prerequisite-patch-id: f39dd059e3ad8af1bd91712b3cdc3f4b1b4c2215
prerequisite-patch-id: 717bf28a8254643211185582bc16f73cdde337ad
prerequisite-patch-id: bf548a1a2f6ccd8a2afdd967ddcab3c21b6fa584
prerequisite-patch-id: 2a2e7a1230dff4cf3329406a745f04668d44deef
prerequisite-patch-id: 333c6a243645d61627cfa1db1b476d831f685733
prerequisite-patch-id: b501b455480e2b45f81e07d7f02856df979644f8
prerequisite-patch-id: 893d532f9f307918862be03babd8dedf7cc5c696
prerequisite-patch-id: cab07afe25c3eb8c7aa3bf4d80e045ac422df1d6
prerequisite-patch-id: 52d5c5e98ad0695d631e336c5746b2074f08469b
prerequisite-patch-id: c8ea5b2983fb74822ab08e2c8a478cb17ff3803d
prerequisite-patch-id: 6dc50fcb267fb29bf8a6ac2e9597371e0772aec1
prerequisite-patch-id: 8552363b8e81fa95829e48d31dd12c5659338ef2
prerequisite-patch-id: 46d96230b4c749208a533d730e4f75b500b3bfac
prerequisite-patch-id: 224ac5e18a1d8674d1e7cf49b7f3e2008c4a213e
prerequisite-patch-id: a52022bfd2c0f6391cfa476202e2ddd5cd676eb0
prerequisite-patch-id: 58cfb87f55f07f147f882f3c9109eb5ad70bfbe1
prerequisite-patch-id: c3752d1c343f9fdbfccd757746e0aa9b53c0c8ae
prerequisite-patch-id: 37e1aeadd0ee2f14c15e29b2e2faee113f12f1cd
prerequisite-patch-id: eb75889d6d31b8807e42c8f03956730c7c8d577a
prerequisite-patch-id: 67484b56a17bd7ac6988ef6a15159279fca59e98
prerequisite-patch-id: 6168f9ec8beb6cb4e711510cafd9a87e717002ea
prerequisite-patch-id: 7646f6fb17ff2fc4f4734d2aa246053dc7dca410
prerequisite-patch-id: d79707796ed09bcf0b495a18aa2d52d00674c69f
prerequisite-patch-id: 648730d1c7e784f873a3b2cf2b6447279a573b5b
prerequisite-patch-id: ef5983802b94d095a5c9cbf962b51cf461981750
prerequisite-patch-id: 2e95a065d81d983ed0056b238ff047c187f5cb91
prerequisite-patch-id: 607615b23dee8b92047aaef1ebb8e50c20f68bcb
prerequisite-patch-id: a30f22e4e13063eb4adc2209b88ec96059078ff5
prerequisite-patch-id: b80bbfd5aa13fc43d332968944f8e1e58f059878
prerequisite-patch-id: 94923ed7ac933489c5ed4f2d61d8f267424f4d43
prerequisite-patch-id: b4820918562f815e50d12e07f264286321f7f711
prerequisite-patch-id: a34fb1f33467b3215196d48ecafbf5483fbb74f3
prerequisite-patch-id: 49f0ce9ceb6adb8c208f57180a8b7348dc5bba06
prerequisite-patch-id: 252d2696d7a34bbae579f15e98324abf843ce08c
prerequisite-patch-id: efc754c834ee2bdcf99fb52f9b942cc5a3dc117d
prerequisite-patch-id: 3b26fa3c1eb1fdf26766a2d5d81e3e171f4539a9
prerequisite-patch-id: c8279b3c9f52ad6420f462cf60d4e52da28ad854
prerequisite-patch-id: 3bbc77d19e638aa15e7d587f6aa4d295a6cf13ca
prerequisite-patch-id: ff39259dc64c2bbe01a88d3b03fdbca4b4836742
prerequisite-patch-id: 720aa5f2bf14f55f28e5ca370c81e7f39bce2f78
prerequisite-patch-id: bfe24b8ed9962db12a48cf819880f4423b54ac1b
prerequisite-patch-id: f25df222a309609258a24bbd334bf91ef3a33ee4
prerequisite-patch-id: b0e3e990e1282bde385d92c0a044be24d30beb9c
prerequisite-patch-id: 30953eacc324ccfc71838fd6428572b14fa86568
prerequisite-patch-id: b59be8efdfc2ca1067275009a83cb74269f82d52
prerequisite-patch-id: f1baea64b666a8d85dff464c25a27b7d4fc616cb
prerequisite-patch-id: d821a76d44ebab904b3b0225d77e52f29c51b346
prerequisite-patch-id: 9a4c443a42166871abb4646c64a90802d4a50275
prerequisite-patch-id: 8b273fe00374c0df5d520206ff5ebdcd74e1b30d
prerequisite-patch-id: 2ac5d698941f4ff6ee12869496554abe201ff69c
prerequisite-patch-id: a9149c87dfe0a855ebfaa2dae5af255d0ca4c236
prerequisite-patch-id: 4cd89ebdfc17035c5e34b60968c3c48253d5c57b
prerequisite-patch-id: 8f3294718baa9f9d2ca2323895554b44517d00d1
prerequisite-patch-id: 27fb2d81a279c08e15fbe45e415bcc3216587b94
prerequisite-patch-id: 90830ae4818c76d8bf6203eff694d7fcba02be92
prerequisite-patch-id: fca67e4393f1f83d2edf93e1e1a1305e777f122d
prerequisite-patch-id: 685354a4dcd12db2e8f85df129fddc409491744d
prerequisite-patch-id: 4a77df82d7fe010beb0b251288006e0fac7b0126
prerequisite-patch-id: bd610e237ea26c096b97b7396dda22a0340bdb95
prerequisite-patch-id: 5480ab41818af05b68154e6f6b0e9251d7de13a1
prerequisite-patch-id: d7f43a5775c32b0c2bbc6427149bff0cdfb7b9f7
prerequisite-patch-id: a4eff81f404c8c543cfd1a78d2715a51bc9184be
prerequisite-patch-id: d0c4d212c1890cd976d1638b4cd5572bbfb5e6eb
prerequisite-patch-id: d3a94fa7de5e9b3ff4f0c28a4ff7af94b06d619c
prerequisite-patch-id: b8f766f3e08241dc218de06211b9745eeb1d5733
prerequisite-patch-id: 16a84abee274f1f819300e325ca1c3d6c9900fd9
prerequisite-patch-id: 89f32cc81d135697e3e7242be6a0c84c9b576972
prerequisite-patch-id: c271d8516dd39526e848dfa95ae38c9205002d2c
prerequisite-patch-id: 927bdde07068e23446aad1958fcbc156b700f516
prerequisite-patch-id: e72a423ecd2cea371d73a60a443b2795875e1cc5
prerequisite-patch-id: e3ddba7e9caefd15c4eec34d1fabb10c786659db
prerequisite-patch-id: f846893eaa5744e41ff077ead047d27bdc8d2ef7
prerequisite-patch-id: 1eb659811a3edc87c9cfff890bf7628c42bf8946
prerequisite-patch-id: 5da0949d5826053fa166b3bd6341e944ba386294
prerequisite-patch-id: b78bb91b72db55bae1d08ba2525d5808a582bf8d
prerequisite-patch-id: 7563087dc5d114383025fbb0236ef8daaa9ae5e6
prerequisite-patch-id: 355de69b4b62f5fc6257ec4b326d843ecaf2c38c
prerequisite-patch-id: ebf08af330da94d0ca102aa21a8872da66969bba
prerequisite-patch-id: 0e57b29bc26e059c72949ef52640fff3eb9aad00
prerequisite-patch-id: 0b421b5c51a0d35696056543e59bc045ac5c22fc
prerequisite-patch-id: c3e73514122d2f5efeff57d891648cdbaeec6adb
prerequisite-patch-id: 3bd82106b77dd35c5b7efc2e48c86d5c4768b485
prerequisite-patch-id: ab3725338ced943c0ebbee475a5f31fa94f144be
prerequisite-patch-id: d93fe877a2f9228f7452710553a18c9b84a3f80c
prerequisite-patch-id: 10251357b689645aa95f5af29dd46d28fb17dc6a
prerequisite-patch-id: bc688bb33ad7c454c17fe59e5ccdde5d9318a30b
prerequisite-patch-id: 6469cbb8d6df8d6c114d86d654c93b89b30d83df
prerequisite-patch-id: 85923199da315460a7aa7fff1ad5635fa08befdf
prerequisite-patch-id: a30c16bcef004fb0fd5a1a813f05c04d3b154bb4
prerequisite-patch-id: 1336ac0045e8680bdcecd2a88ea06c3908f0dd52
prerequisite-patch-id: 45c3b42999004eb772a3159c91abdda69d9e05d4
prerequisite-patch-id: 3772da730640e7d04cf93e8d9901b825137ade2c
-- 
2.25.1

