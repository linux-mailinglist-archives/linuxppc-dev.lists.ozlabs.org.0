Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC0FC393
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:07:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DHFx1bSXzF4Y7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DFy52xlBzF5mD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:08:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47DFy34kM9z9sSL; Thu, 14 Nov 2019 20:08:11 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47DFy33C6Yz9sSP; Thu, 14 Nov 2019 20:08:11 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 273df864cf7466fb170b8dcc1abd672cd08ad8d3
In-Reply-To: <1572492694-6520-8-git-send-email-zohar@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v10 7/9] ima: check against blacklisted hashes for files
 with modsig
Message-Id: <47DFy33C6Yz9sSP@ozlabs.org>
Date: Thu, 14 Nov 2019 20:08:11 +1100 (AEDT)
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Jessica Yu <jeyu@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-10-31 at 03:31:32 UTC, Mimi Zohar wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
> 
> Asymmetric private keys are used to sign multiple files.  The kernel
> currently supports checking against blacklisted keys.  However, if the
> public key is blacklisted, any file signed by the blacklisted key will
> automatically fail signature verification.  Blacklisting the public
> key is not fine enough granularity, as we might want to only blacklist
> a particular file.
> 
> This patch adds support for checking against the blacklisted hash of
> the file, without the appended signature, based on the IMA policy.  It
> defines a new policy option "appraise_flag=check_blacklist".
> 
> In addition to the blacklisted binary hashes stored in the firmware "dbx"
> variable, the Linux kernel may be configured to load blacklisted binary
> hashes onto the .blacklist keyring as well.  The following example shows
> how to blacklist a specific kernel module hash.
> 
> $ sha256sum kernel/kheaders.ko
> 77fa889b35a05338ec52e51591c1b89d4c8d1c99a21251d7c22b1a8642a6bad3
> kernel/kheaders.ko
> 
> $ grep BLACKLIST .config
> CONFIG_SYSTEM_BLACKLIST_KEYRING=y
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST="blacklist-hash-list"
> 
> $ cat certs/blacklist-hash-list
> "bin:77fa889b35a05338ec52e51591c1b89d4c8d1c99a21251d7c22b1a8642a6bad3"
> 
> Update the IMA custom measurement and appraisal policy rules
> (/etc/ima-policy):
> 
> measure func=MODULE_CHECK template=ima-modsig
> appraise func=MODULE_CHECK appraise_flag=check_blacklist
> appraise_type=imasig|modsig
> 
> After building, installing, and rebooting the kernel:
> 
>  545660333 ---lswrv      0     0   \_ blacklist:
> bin:77fa889b35a05338ec52e51591c1b89d4c8d1c99a21251d7c22b1a8642a6bad3
> 
> measure func=MODULE_CHECK template=ima-modsig
> appraise func=MODULE_CHECK appraise_flag=check_blacklist
> appraise_type=imasig|modsig
> 
> modprobe: ERROR: could not insert 'kheaders': Permission denied
> 
> 10 0c9834db5a0182c1fb0cdc5d3adcf11a11fd83dd ima-sig
> sha256:3bc6ed4f0b4d6e31bc1dbc9ef844605abc7afdc6d81a57d77a1ec9407997c40
> 2 /usr/lib/modules/5.4.0-rc3+/kernel/kernel/kheaders.ko
> 
> 10 82aad2bcc3fa8ed94762356b5c14838f3bcfa6a0 ima-modsig
> sha256:3bc6ed4f0b4d6e31bc1dbc9ef844605abc7afdc6d81a57d77a1ec9407997c40
> 2 /usr/lib/modules/5.4.0rc3+/kernel/kernel/kheaders.ko  sha256:77fa889b3
> 5a05338ec52e51591c1b89d4c8d1c99a21251d7c22b1a8642a6bad3
> 3082029a06092a864886f70d010702a082028b30820287020101310d300b0609608648
> 016503040201300b06092a864886f70d01070131820264....
> 
> 10 25b72217cc1152b44b134ce2cd68f12dfb71acb3 ima-buf
> sha256:8b58427fedcf8f4b20bc8dc007f2e232bf7285d7b93a66476321f9c2a3aa132
> b blacklisted-hash
> 77fa889b35a05338ec52e51591c1b89d4c8d1c99a21251d7c22b1a8642a6bad3
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Cc: Jessica Yu <jeyu@kernel.org>
> Cc: David Howells <dhowells@redhat.com>
> [zohar@linux.ibm.com: updated patch description]
> Signed-off-by: Mimi Zohar <zohar@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/273df864cf7466fb170b8dcc1abd672cd08ad8d3

cheers
