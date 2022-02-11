Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299284B2920
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 16:31:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwHdw5jKFz3cTY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 02:31:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwHdQ6Nghz3bZX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 02:31:04 +1100 (AEDT)
Received: from [192.168.0.2] (ip5f5aebe1.dynamic.kabel-deutschland.de
 [95.90.235.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 20C7A61EA1927;
 Fri, 11 Feb 2022 16:31:01 +0100 (CET)
Message-ID: <53069280-73e6-4502-d366-4990b74cf059@molgen.mpg.de>
Date: Fri, 11 Feb 2022 16:31:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
 <b56fe3a2-b145-9d4e-acf2-4991204b3102@molgen.mpg.de>
 <20220209120154.GC3113@kunlun.suse.cz>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220209120154.GC3113@kunlun.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-crypto@vger.kernel.org,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Michal,


Am 09.02.22 um 13:01 schrieb Michal Suchánek:

> On Wed, Feb 09, 2022 at 07:44:15AM +0100, Paul Menzel wrote:

>> Am 11.01.22 um 12:37 schrieb Michal Suchanek:

[…]

>> How can this be tested?
> 
> Apparently KEXEC_SIG_FORCE is x86 only although the use of the option is
> arch neutral:
> 
> arch/x86/Kconfig:config KEXEC_SIG_FORCE
> kernel/kexec_file.c:            if (IS_ENABLED(CONFIG_KEXEC_SIG_FORCE))
> {
> 
> Maybe it should be moved?

Sounds good.

> I used a patched kernel that enables lockdown in secure boot, and then
> verified that signed kernel can be loaded by kexec and unsigned not,
> with KEXEC_SIG enabled and IMA_KEXEC disabled.
> 
> The lockdown support can be enabled on any platform, and although I
> can't find it documented anywhere there appears to be code in kexec_file
> to take it into account:
> kernel/kexec.c: result = security_locked_down(LOCKDOWN_KEXEC);
> kernel/kexec_file.c:                security_locked_down(LOCKDOWN_KEXEC))
> kernel/module.c:        return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
> kernel/params.c:            security_locked_down(LOCKDOWN_MODULE_PARAMETERS))
> and lockdown can be enabled with a buildtime option, a kernel parameter, or a
> debugfs file.
> 
> Still for testing lifting KEXEC_SIG_FORCE to some arch-neutral Kconfig file is
> probably the simplest option.
> 
> kexec -s option should be used to select kexec_file rather than the old
> style kexec which would either fail always or succeed always regardelss
> of signature.

Thank you.

>>> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
>>> ---
>>> v3: - Philipp Rudo <prudo@redhat.com>: Update the comit message with
>>>         explanation why the s390 code is usable on powerpc.
>>>       - Include correct header for mod_check_sig
>>>       - Nayna <nayna@linux.vnet.ibm.com>: Mention additional IMA features
>>>         in kconfig text
>>> ---
>>>    arch/powerpc/Kconfig        | 16 ++++++++++++++++
>>>    arch/powerpc/kexec/elf_64.c | 36 ++++++++++++++++++++++++++++++++++++
>>>    2 files changed, 52 insertions(+)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index dea74d7717c0..1cde9b6c5987 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -560,6 +560,22 @@ config KEXEC_FILE
>>>    config ARCH_HAS_KEXEC_PURGATORY
>>>    	def_bool KEXEC_FILE
>>> +config KEXEC_SIG
>>> +	bool "Verify kernel signature during kexec_file_load() syscall"
>>> +	depends on KEXEC_FILE && MODULE_SIG_FORMAT
>>> +	help
>>> +	  This option makes kernel signature verification mandatory for
>>> +	  the kexec_file_load() syscall.
>>> +
>>> +	  In addition to that option, you need to enable signature
>>> +	  verification for the corresponding kernel image type being
>>> +	  loaded in order for this to work.
>>> +
>>> +	  Note: on powerpc IMA_ARCH_POLICY also implements kexec'ed kernel
>>> +	  verification. In addition IMA adds kernel hashes to the measurement
>>> +	  list, extends IMA PCR in the TPM, and implements kernel image
>>> +	  blacklist by hash.
>>
>> So, what is the takeaway for the user? IMA_ARCH_POLICY is preferred? What is
>> the disadvantage, and two implementations(?) needed then? More overhead?
> 
> IMA_KEXEC does more than KEXEC_SIG. The overhead is probably not big
> unless you are trying to really minimize the kernel code size.
> 
> Arguably the simpler implementation has less potential for bugs, too.
> Both in code and in user configuration required to enable the feature.
> 
> Interestingly IMA_ARCH_POLICY depends on KEXEC_SIG rather than
> IMA_KEXEC. Just mind-boggling.

I have not looked into that.

> The main problem with IMA_KEXEC from my point of view is it is not portable.
> To record the measurements TPM support is requireed which is not available on
> all platforms. It does not support PE so it cannot be used on platforms
> that use PE kernel signature format.

Could you add that to the comment please?

>>> +
>>>    config RELOCATABLE
>>>    	bool "Build a relocatable kernel"
>>>    	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
>>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>> index eeb258002d1e..98d1cb5135b4 100644
>>> --- a/arch/powerpc/kexec/elf_64.c
>>> +++ b/arch/powerpc/kexec/elf_64.c
>>> @@ -23,6 +23,7 @@
>>>    #include <linux/of_fdt.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/types.h>
>>> +#include <linux/module_signature.h>
>>>    static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>    			unsigned long kernel_len, char *initrd,
>>> @@ -151,7 +152,42 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>>    	return ret ? ERR_PTR(ret) : NULL;
>>>    }
>>> +#ifdef CONFIG_KEXEC_SIG
>>> +int elf64_verify_sig(const char *kernel, unsigned long kernel_len)
>>> +{
>>> +	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
>>> +	struct module_signature *ms;
>>> +	unsigned long sig_len;
>>
>> Use size_t to match the signature of `verify_pkcs7_signature()`?
> 
> Nope. struct module_signature uses unsigned long, and this needs to be
> matched to avoid type errors on 32bit.

I meant for `sig_len`.

> Technically using size_t for in-memory buffers is misguided because
> AFAICT no memory buffer can be bigger than ULONG_MAX, and size_t is
> non-native type on 32bit.
> 
> Sure, the situation with ssize_t/int is different but that's not what we
> are dealing with here.
True. In my experience it prevents compiler warnings when building for 
32 bit or 64 bit. Anyway, not that important.


Kind regards,

Paul
