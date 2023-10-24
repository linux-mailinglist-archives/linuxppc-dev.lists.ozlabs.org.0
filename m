Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA17D5145
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 15:18:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=n5Juawav;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ho066+fp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFCLZ21cxz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 00:18:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=n5Juawav;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ho066+fp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFCKc0RbHz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 00:17:55 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CEEBB5C017D;
	Tue, 24 Oct 2023 09:17:51 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 24 Oct 2023 09:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698153471; x=1698239871; bh=ju
	LUN5EOf1oun38yO5yy2NS/PjvfZz4177Yn5+hz4yQ=; b=n5JuawavBckG+td4zd
	9bgRwuRpqQu0e1li/e77umwTpwdBwy0DLjFX3CyNt7mh81Xb8VYW0gXvlCFWRw6B
	hj+fijwsz4eR49wI1VEhiMuAzHMpeRbELUPOmwyMHvqXjYp/QUR+9/Se6UYL+T4L
	WDLTJHnW+8emUnHY2/S3SYHChMwDWnqqUAr12P0GwcRPCfjHc/Vx6zet1zUiY9Ab
	QW3noxYanY1quUXitS/QIyprE60azjurUOVXm3jRf8IdUBLJOPQUfQwF1h0Y5NGi
	6gLzeDZxr2RnAK37E9QNOt1pBZVPzuFw/z/XlaaIMV9UrlXcEYm5x7VM6gugIv8o
	UBfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698153471; x=1698239871; bh=juLUN5EOf1oun
	38yO5yy2NS/PjvfZz4177Yn5+hz4yQ=; b=ho066+fpz4vqxQspl7eYkBvf670M0
	QafoG/BnV/LA3QmmYpX25gHOuy6e1KX2q/EJoviBgTiQ8bEtGXhlgixr0PdEtdHP
	UdgVO0ss1ZYKXyYAaPFpHpAb7uNyOApEx16iBFvqNHtzguv2pCDNgoXgDvDBXbx2
	Eum49PB45Qv1wQwNAXunVGDvSL4OeJfcTdyC4QaVURCUcVN4eVgopaLx8oMT2E7V
	cq9G95XNfiV1VTUkmn6go/PuJpp4x55ovVtU75KGke9BYIzfPM9PljR5ZiBtKHN/
	HPitZ1g+BQNBBD4GmNtyUC4pTpD3oY2cjimFc6ZnqS4klc1L3cWmqG2ZQ==
X-ME-Sender: <xms:_8M3ZWnJnKjq_-kk6s0hEnizc7y7AA36OyfNpqdFxNL3KSw6-4sY1Q>
    <xme:_8M3Zd0zeKpSAD9_8WXmQGhYKMSP-M1Q-xFKuHbxpV6DepRGPaO4shdXDsw2hw3Al
    eIRSW-rISm1gEikWDE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeekgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_8M3ZUr74gAI76OAf2EDNunWuT_V6DLiFSCudIcNRc7aC5BeecLhVA>
    <xmx:_8M3ZanmhGeqVetdMi6TitKDZMbJNC4wsgyPPj9eM5Vi7_rKEQrMbQ>
    <xmx:_8M3ZU3Q4egefEBR3jYS0LbN2LFQKF0qlsVLKvLUFuM8mUjpwbnnCQ>
    <xmx:_8M3ZVJKz9SsDBha72wGsT4j53_R7egs9Gz0MK1aBidGMKZdv-co3Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5ADF0B60089; Tue, 24 Oct 2023 09:17:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <b71034f4-5cdc-44e0-b72f-1a8ffae0593e@app.fastmail.com>
In-Reply-To: <ZTe8NOgAjvKDA6z0@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <ZTe8NOgAjvKDA6z0@MiWiFi-R3L-srv>
Date: Tue, 24 Oct 2023 15:17:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Baoquan He" <bhe@redhat.com>
Subject: Re: [PATCH 1/2] kexec: fix KEXEC_FILE dependencies
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, eric_devolder@yahoo.com, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 24, 2023, at 14:44, Baoquan He wrote:
> Just add people and mailing list to CC since I didn't find this mail in
> my box, just drag it via 'b4 am'.
>
> On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
> ......

>> diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
>> index 7aff28ded2f48..bfc636d64ff2b 100644
>> --- a/kernel/Kconfig.kexec
>> +++ b/kernel/Kconfig.kexec
>> @@ -36,6 +36,7 @@ config KEXEC
>>  config KEXEC_FILE
>>  	bool "Enable kexec file based system call"
>>  	depends on ARCH_SUPPORTS_KEXEC_FILE
>> +	depends on CRYPTO_SHA256=y || !ARCH_SUPPORTS_KEXEC_PURGATORY
>
> I am not sure if the logic is correct. In theory, kexec_file code
> utilizes purgatory to verify the checksum digested during kernel loading
> when try to jump to the kernel. That means kexec_file depends on
> purgatory, but not contrary?

The expression I wrote is a bit confusing, but I think this just
keeps the existing behavior:

- on architectures that select ARCH_SUPPORTS_KEXEC_PURGATORY
  (powerpc, riscv, s390 and x86), we also require CRYPTO_SHA256
  to be built-in.
- on architectures that do not have ARCH_SUPPORTS_KEXEC_PURGATORY
  (arm64 and parisc), CRYPTO_SHA256 is not used and can be disabled
  or =m.

Since ARCH_SUPPORTS_KEXEC_PURGATORY is a 'bool' symbol, it could
be written as

depends on (ARCH_SUPPORTS_KEXEC_PURGATORY && CRYPTO_SHA256=y) \
           || !ARCH_SUPPORTS_KEXEC_PURGATORY

if you find that clearer. I see that the second patch
actually gets this wrong, it should actually do

select CRYPTO if ARCH_SUPPORTS_KEXEC_PURGATORY
select CRYPTO_SHA256 if ARCH_SUPPORTS_KEXEC_PURGATORY

> With these changes, we can achieve the goal to avoid building issue,
> whereas the code logic becomes confusing. E.g people could disable
> CONFIG_KEXEC_FILE, but still get purgatory code built in which is
> totally useless.
>
> Not sure if I think too much over this.

I see your point here, and I would suggest changing the
CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY symbol to just indicate
the availability of the purgatory code for the arch, rather
than actually controlling the code itself. I already mentioned
this for s390, but riscv would need the same thing on top.

I think the change below should address your concern.

     Arnd

diff --git a/arch/riscv/kernel/elf_kexec.c b/arch/riscv/kernel/elf_kexec.c
index e60fbd8660c4..3ac341d296db 100644
--- a/arch/riscv/kernel/elf_kexec.c
+++ b/arch/riscv/kernel/elf_kexec.c
@@ -266,7 +266,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
                cmdline = modified_cmdline;
        }
 
-#ifdef CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY
+#ifdef CONFIG_KEXEC_FILE
        /* Add purgatory to the image */
        kbuf.top_down = true;
        kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
@@ -280,7 +280,7 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
                                             sizeof(kernel_start), 0);
        if (ret)
                pr_err("Error update purgatory ret=%d\n", ret);
-#endif /* CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY */
+#endif /* CONFIG_KEXEC_FILE */
 
        /* Add the initrd to the image */
        if (initrd != NULL) {
diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index d25ad1c19f88..ab181d187c23 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -5,7 +5,7 @@ obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
 obj-y += errata/
 obj-$(CONFIG_KVM) += kvm/
 
-obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
+obj-$(CONFIG_KEXEC_FILE) += purgatory/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/s390/Kbuild b/arch/s390/Kbuild
index a5d3503b353c..361aa01dbd49 100644
--- a/arch/s390/Kbuild
+++ b/arch/s390/Kbuild
@@ -7,7 +7,7 @@ obj-$(CONFIG_S390_HYPFS)        += hypfs/
 obj-$(CONFIG_APPLDATA_BASE)    += appldata/
 obj-y                          += net/
 obj-$(CONFIG_PCI)              += pci/
-obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
+obj-$(CONFIG_KEXEC_FILE)       += purgatory/
 
 # for cleaning
 subdir- += boot tools

