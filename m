Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BC3A7390
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 04:06:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3sBC21ZTz3c3t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 12:06:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=BiKG15yk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BiKG15yk; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3s9j12mTz3btR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 12:06:00 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id ei4so10867223pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 19:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=/26rAjAQD532aMV33kxWrl6Z5akeGf8wTzm+VtoFAIk=;
 b=BiKG15ykC+48N69GiJAk682DfkkUFAYcudu9PVVb4CxuMdOdzXfdPEk3lsBN779Ul1
 PMRH4AqNSBP8qGnbtdjj6FmMn9LNc2NE4fCZffHTWPUdwaOLcMxfHWHnr4PUNujOIdGH
 PoxocM57YzKshDkcvSkeT8BGvxQuZszI6IaIUYHOZi6MNiFuP53z6NovlctOxExvUolG
 kNLOFnVJZ4jJ1SA2y7vm8Ieyi0ROV8nJVrrAC6//tzZitQB4Wk7Z2LxOU2bwOsbvRgEr
 9mGs+oSC9BPfYZMdkDMYqASyBkxTsCxjlVrBNOKF53rdsrsuAlCmHW4PyXcF602h41Gp
 qZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=/26rAjAQD532aMV33kxWrl6Z5akeGf8wTzm+VtoFAIk=;
 b=q8nqGHPHqx8/yTyoekKyOi1rUa7s/MtBeLaTNZWa45zPe5nidzvIX3Jo0Y8BE2Bvm2
 FnQ/2rFJjdqIcqOYe0PyZDetOSpn23RyqEKhQuU5vMjNDHEpMHEHaMGnMVV4TKAiaR/l
 wuiLVQxq00x3QjhcAp6Zlu6NjOI5+QLX/BPjEgYRAqjWfo9Lzp6zbADIc6P5UTyVtU/B
 jRUgtliccm3MZpjIQeVFnu4A4oP0x1rGETZM6boLCws9CAjGszkyA3StI4PRnFECQZxO
 zKEmmxD4wzFjTNIPmJNs8pDQh75OIJYRG1s4wad3avBFz/w+Nqq+YXdbRtijA+otcIft
 NvvQ==
X-Gm-Message-State: AOAM533zv6uJR2PHimyDPxhKtGtKb6mWjV+EvAEL+v/3l+tYW+vnu2AW
 XMzIfUXn33p7+GuM6NE7OQc=
X-Google-Smtp-Source: ABdhPJxBXvT2cqEVnszms6D+WEFTva3OAy+sF5MqCZfIDeWLB2YaQhkHMVo+AThKhax0NwzCEjp32g==
X-Received: by 2002:a17:90a:528d:: with SMTP id
 w13mr2193869pjh.135.1623722756431; 
 Mon, 14 Jun 2021 19:05:56 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id t12sm14132849pfc.133.2021.06.14.19.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:05:56 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:05:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 1/2] module: add elf_check_module_arch for module
 specific elf arch checks
To: Jessica Yu <jeyu@kernel.org>
References: <20210611093959.821525-1-npiggin@gmail.com>
 <20210611093959.821525-2-npiggin@gmail.com>
 <YMdGWjBOmcstBwOl@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
In-Reply-To: <YMdGWjBOmcstBwOl@p200300cbcf109700df096d564fe976c3.dip0.t-ipconnect.de>
MIME-Version: 1.0
Message-Id: <1623722110.amu32mwaqs.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Jessica Yu's message of June 14, 2021 10:06 pm:
> +++ Nicholas Piggin [11/06/21 19:39 +1000]:
>>The elf_check_arch() function is used to test usermode binaries, but
>>kernel modules may have more specific requirements. powerpc would like
>>to test for ABI version compatibility.
>>
>>Add an arch-overridable function elf_check_module_arch() that defaults
>>to elf_check_arch() and use it in elf_validity_check().
>>
>>Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>[np: split patch, added changelog]
>>Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>---
>> include/linux/moduleloader.h | 5 +++++
>> kernel/module.c              | 2 +-
>> 2 files changed, 6 insertions(+), 1 deletion(-)
>>
>>diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
>>index 9e09d11ffe5b..fdc042a84562 100644
>>--- a/include/linux/moduleloader.h
>>+++ b/include/linux/moduleloader.h
>>@@ -13,6 +13,11 @@
>>  * must be implemented by each architecture.
>>  */
>>
>>+// Allow arch to optionally do additional checking of module ELF header
>>+#ifndef elf_check_module_arch
>>+#define elf_check_module_arch elf_check_arch
>>+#endif
>=20
> Hi Nicholas,
>=20
> Why not make elf_check_module_arch() consistent with the other
> arch-specific functions? Please see module_frob_arch_sections(),
> module_{init,exit}_section(), etc in moduleloader.h. That is, they are
> all __weak functions that are overridable by arches. We can maybe make
> elf_check_module_arch() a weak symbol, available for arches to
> override if they want to perform additional elf checks. Then we don't
> have to have this one-off #define.


Like this? I like it. Good idea.

Thanks,
Nick

diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
index 9e09d11ffe5b..7b4587a19189 100644
--- a/include/linux/moduleloader.h
+++ b/include/linux/moduleloader.h
@@ -13,6 +13,9 @@
  * must be implemented by each architecture.
  */
=20
+/* arch may override to do additional checking of ELF header architecture =
*/
+bool module_elf_check_arch(Elf_Ehdr *hdr);
+
 /* Adjust arch-specific sections.  Return 0 on success.  */
 int module_frob_arch_sections(Elf_Ehdr *hdr,
 			      Elf_Shdr *sechdrs,
diff --git a/kernel/module.c b/kernel/module.c
index 7e78dfabca97..8b31c0b7c2a0 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3459,6 +3459,11 @@ static void flush_module_icache(const struct module =
*mod)
 			   (unsigned long)mod->core_layout.base + mod->core_layout.size);
 }
=20
+bool __weak module_elf_check_arch(Elf_Ehdr *hdr)
+{
+	return elf_check_arch(hdr);
+}
+
 int __weak module_frob_arch_sections(Elf_Ehdr *hdr,
 				     Elf_Shdr *sechdrs,
 				     char *secstrings,
