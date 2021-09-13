Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F2040926F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 16:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7Szn1RYSz2yPX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 00:10:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rskVLjWz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=jgross@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=susede1 header.b=rskVLjWz; dkim-atps=neutral
X-Greylist: delayed 709 seconds by postgrey-1.36 at boromir;
 Tue, 14 Sep 2021 00:09:42 AEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7SzB0v4yz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 00:09:41 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EC9A61FD84;
 Mon, 13 Sep 2021 13:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1631541468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hH7Iy2pE2qXXycVl+pdgp/YjaWw0chbvKCaG1nR6wMw=;
 b=rskVLjWzWO+SQgKM7whOVKZMJUU4eAWiaaJMkUHgZ4o7XtDWNqJkR0Wr4hdo3PNSaEbKzB
 Exa6amYfD+QDBiQhuM+DEZysqjzQngjO3Q3MK8s9iFamZnSgC1AeJZJ+unDND6ZpNFUZSC
 o24T08ZH8M+lcBm0flqCa3TxOm58Cks=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0B52D13AB2;
 Mon, 13 Sep 2021 13:57:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ucX7ANxYP2FMUwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Sep 2021 13:57:48 +0000
From: Juergen Gross <jgross@suse.com>
To: kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] kvm: fix KVM_MAX_VCPU_ID handling
Date: Mon, 13 Sep 2021 15:57:42 +0200
Message-Id: <20210913135745.13944-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Juergen Gross <jgross@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Wanpeng Li <wanpengli@tencent.com>, Jonathan Corbet <corbet@lwn.net>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Revert commit 76b4f357d0e7d8f6f00 which was based on wrong reasoning
and rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS in order to avoid the
same issue in future.

Juergen Gross (2):
  x86/kvm: revert commit 76b4f357d0e7d8f6f00
  kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS

 Documentation/virt/kvm/devices/xics.rst            | 2 +-
 Documentation/virt/kvm/devices/xive.rst            | 2 +-
 arch/mips/kvm/mips.c                               | 2 +-
 arch/powerpc/include/asm/kvm_book3s.h              | 2 +-
 arch/powerpc/include/asm/kvm_host.h                | 4 ++--
 arch/powerpc/kvm/book3s_xive.c                     | 2 +-
 arch/powerpc/kvm/powerpc.c                         | 2 +-
 arch/x86/include/asm/kvm_host.h                    | 2 +-
 arch/x86/kvm/ioapic.c                              | 2 +-
 arch/x86/kvm/ioapic.h                              | 4 ++--
 arch/x86/kvm/x86.c                                 | 2 +-
 include/linux/kvm_host.h                           | 4 ++--
 tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 2 +-
 virt/kvm/kvm_main.c                                | 2 +-
 14 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.26.2

