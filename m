Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA6F85C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 02:00:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BqCr6N4pzF3Jr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 12:00:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqemgate14.nvidia.com; envelope-from=jhubbard@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.b="Y02O+zm4"; 
 dkim-atps=neutral
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bp3G0vThzF4Lx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 11:07:37 +1100 (AEDT)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7c40000>; Mon, 11 Nov 2019 16:07:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:29 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:29 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:28 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:27 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7be0004>; Mon, 11 Nov 2019 16:07:27 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 22/23] selftests/vm: run_vmtests: invoke gup_benchmark with
 basic FOLL_PIN coverage
Date: Mon, 11 Nov 2019 16:06:59 -0800
Message-ID: <20191112000700.3455038-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573517252; bh=xFb3SiLgCLKE3iiV7irzvOfCSAuS+AWjP3FT0BNaO3M=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Y02O+zm41OtyFNsGjNycWuJAr67vxLxYcKkoymytbQptL0pJpNquIFtGtQxVGgjYi
 6OplSmzWMi9MtpWyuey/r7bm3Ita5M1Yicz9xrz8WIHcRAfxADwp8wDMEkaNfBfHB7
 TsxAeXqTTlUTi5f5c6ttks8pqWUeydYApff24tF22A5/4E3tXOHFbOyMois1MUdG6L
 ZVdGteudEW9Voaebi1PmqXqytVqMM9rY9d18kW+4HDfMGqxOTHcC7DRx8C2+qLLz1K
 FRi1I11rc4EM+xWMM5OiD//3jcIM0jl4AtlVKkVNt9E2Nk1GRMg+OyZDNOa8054Kyh
 vC7flmzVSQjjQ==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's good to have basic unit test coverage of the new FOLL_PIN
behavior. Fortunately, the gup_benchmark unit test is extremely
fast (a few milliseconds), so adding it the the run_vmtests suite
is going to cause no noticeable change in running time.

So, add two new invocations to run_vmtests:

1) Run gup_benchmark with normal get_user_pages().

2) Run gup_benchmark with pin_user_pages(). This is much like
the first call, except that it sets FOLL_PIN.

Running these two in quick succession also provide a visual
comparison of the running times, which is convenient.

The new invocations are fairly early in the run_vmtests script,
because with test suites, it's usually preferable to put the
shorter, faster tests first, all other things being equal.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 tools/testing/selftests/vm/run_vmtests | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftes=
ts/vm/run_vmtests
index 951c507a27f7..93e8dc9a7cad 100755
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@ -104,6 +104,28 @@ echo "NOTE: The above hugetlb tests provide minimal co=
verage.  Use"
 echo "      https://github.com/libhugetlbfs/libhugetlbfs.git for"
 echo "      hugetlb regression testing."
=20
+echo "--------------------------------------------"
+echo "running 'gup_benchmark -U' (normal/slow gup)"
+echo "--------------------------------------------"
+./gup_benchmark -U
+if [ $? -ne 0 ]; then
+	echo "[FAIL]"
+	exitcode=3D1
+else
+	echo "[PASS]"
+fi
+
+echo "------------------------------------------"
+echo "running gup_benchmark -c (pin_user_pages)"
+echo "------------------------------------------"
+./gup_benchmark -c
+if [ $? -ne 0 ]; then
+	echo "[FAIL]"
+	exitcode=3D1
+else
+	echo "[PASS]"
+fi
+
 echo "-------------------"
 echo "running userfaultfd"
 echo "-------------------"
--=20
2.24.0

