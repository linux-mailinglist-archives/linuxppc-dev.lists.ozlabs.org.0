Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74881C4AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 06:36:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gqC3NDNp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxGHl3Xwbz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 16:36:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gqC3NDNp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxGGs4Kykz30PJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 16:35:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 447E461AF3;
	Fri, 22 Dec 2023 05:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C306DC433CA;
	Fri, 22 Dec 2023 05:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703223327;
	bh=S3+IvGow6OfbvyCxmFUeP8nVvq1zubSgdZKMLCh8qUQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=gqC3NDNpMOJQpzHYTJ/WWkeK1vGzvRSHjoz6OP8ud4i04z/r2EZfmH3tniHrnFadL
	 io2/m1sFzc+DRQkxJsCcmNMuFk6epvE0WQ0IaQR5SfMLTiCmQTmsVyvt6rTQZnYfnT
	 hbs6zbiqROhDLjU/FCTXuko1c2vJngfTtWA0smQFZidvcRG0TfTNZYG6tz2K8GQ/Xm
	 UBcSfH2J522QDK7wkW/aFA24nJO9THu8CXDYCL4QrKY9vkDb+SFncvsH5lZCTf6Q/7
	 ozqK3i/1P4W47D/9cMNnKuyUQM2FOqLKG6/iqYtqZG0c9RQPbpeSGIFOvaXRFDpD7q
	 Q3+hSGIaBta5g==
Date: Thu, 21 Dec 2023 21:35:26 -0800
From: Kees Cook <kees@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Luis Chamberlain <mcgrof@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/3=5D_init=3A_Declare_rodata=5Fe?= =?US-ASCII?Q?nabled_and_mark=5Frodata=5Fro=28=29_at_all_time?=
User-Agent: K-9 Mail for Android
In-Reply-To: <87bkajlphj.fsf@mail.lhotse>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu> <87bkajlphj.fsf@mail.lhotse>
Message-ID: <D5F308F6-C394-4CC3-9C0C-923EDB055D0D@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On December 21, 2023 4:16:56 AM PST, Michael Ellerman <mpe@ellerman=2Eid=
=2Eau> wrote:
>Cc +Kees
>
>Christophe Leroy <christophe=2Eleroy@csgroup=2Eeu> writes:
>> Declaring rodata_enabled and mark_rodata_ro() at all time
>> helps removing related #ifdefery in C files=2E
>>
>> Signed-off-by: Christophe Leroy <christophe=2Eleroy@csgroup=2Eeu>
>> ---
>>  include/linux/init=2Eh |  4 ----
>>  init/main=2Ec          | 21 +++++++--------------
>>  2 files changed, 7 insertions(+), 18 deletions(-)
>>
>> diff --git a/include/linux/init=2Eh b/include/linux/init=2Eh
>> index 01b52c9c7526=2E=2Ed2b47be38a07 100644
>> --- a/include/linux/init=2Eh
>> +++ b/include/linux/init=2Eh
>> @@ -168,12 +168,8 @@ extern initcall_entry_t __initcall_end[];
>> =20
>>  extern struct file_system_type rootfs_fs_type;
>> =20
>> -#if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_STRICT_MODULE_=
RWX)
>>  extern bool rodata_enabled;
>> -#endif
>> -#ifdef CONFIG_STRICT_KERNEL_RWX
>>  void mark_rodata_ro(void);
>> -#endif
>> =20
>>  extern void (*late_time_init)(void);
>> =20
>> diff --git a/init/main=2Ec b/init/main=2Ec
>> index e24b0780fdff=2E=2E807df08c501f 100644
>> --- a/init/main=2Ec
>> +++ b/init/main=2Ec
>> @@ -1396,10 +1396,9 @@ static int __init set_debug_rodata(char *str)
>>  early_param("rodata", set_debug_rodata);
>>  #endif
>> =20
>> -#ifdef CONFIG_STRICT_KERNEL_RWX
>>  static void mark_readonly(void)
>>  {
>> -	if (rodata_enabled) {
>> +	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled) {

I think this will break without rodata_enabled actual existing on other ar=
chitectures=2E (Only declaration was made visible, not the definition, whic=
h is above here and still behind ifdefs?)

-Kees

>>  		/*
>>  		 * load_module() results in W+X mappings, which are cleaned
>>  		 * up with call_rcu()=2E  Let's make sure that queued work is
>> @@ -1409,20 +1408,14 @@ static void mark_readonly(void)
>>  		rcu_barrier();
>>  		mark_rodata_ro();
>>  		rodata_test();
>> -	} else
>> +	} else if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
>>  		pr_info("Kernel memory protection disabled=2E\n");
>> +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)) {
>> +		pr_warn("Kernel memory protection not selected by kernel config=2E\n=
");
>> +	} else {
>> +		pr_warn("This architecture does not have kernel memory protection=2E=
\n");
>> +	}
>>  }
>> -#elif defined(CONFIG_ARCH_HAS_STRICT_KERNEL_RWX)
>> -static inline void mark_readonly(void)
>> -{
>> -	pr_warn("Kernel memory protection not selected by kernel config=2E\n"=
);
>> -}
>> -#else
>> -static inline void mark_readonly(void)
>> -{
>> -	pr_warn("This architecture does not have kernel memory protection=2E\=
n");
>> -}
>> -#endif
>> =20
>>  void __weak free_initmem(void)
>>  {
>> --=20
>> 2=2E41=2E0

--=20
Kees Cook
