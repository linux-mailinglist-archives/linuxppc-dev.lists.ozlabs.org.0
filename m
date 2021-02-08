Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7291F3129A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 05:14:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYt2c1rN3zDsYn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 15:14:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYt104qdqzDr7Q
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 15:13:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SQsvL45j; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DYt0t66nsz9sVF;
 Mon,  8 Feb 2021 15:13:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612757588;
 bh=OO7xGWmsUnuYQgc3bx44I7oadxiJ3c+qloWk8zo8s/E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SQsvL45jlKpqUCEP8e1n03m12ASsrcsFM4rulmGn0o0JHZVPyDkisCyaZygcFW+w/
 o+aNZskRfsTmGwMpW337LVHKl/7fzsO7W/0NkNFfBpab7Nq/iTWuLQYB5o7WrlGlgR
 vrm9InatVSOATOiUKFPVdFYZ1JXjJqQkTzJjF+50Dkp6/IBYDj8ZWuJoomQ79smix5
 Jb09M2DIY7piouMND8uNftwaBdOiAx0C8HFgF5ekV/3yH2poxd2WulSITdHQwwW01E
 tXf52460TJkHIrDDaHHGbop5tjAoaZRaWZb+tWdI8YhTvmkDE9J66esGpcdkyVyXAX
 oUG7BiZkbIKyw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, Lakshmi Ramasubramanian
 <nramas@linux.microsoft.com>
Subject: Re: [PATCH v16 11/12] powerpc: Use OF alloc and free for FDT
In-Reply-To: <CAL_JsqK1Pb9nAeL84EP2U3MQgpBsm+E_0QXmzbigWXnS245WPQ@mail.gmail.com>
References: <20210204164135.29856-1-nramas@linux.microsoft.com>
 <20210204164135.29856-12-nramas@linux.microsoft.com>
 <CAL_JsqK1Pb9nAeL84EP2U3MQgpBsm+E_0QXmzbigWXnS245WPQ@mail.gmail.com>
Date: Mon, 08 Feb 2021 15:12:59 +1100
Message-ID: <87zh0fnqno.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Bhupesh Sharma <bhsharma@redhat.com>,
 tao.li@vivo.com, Mimi Zohar <zohar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, vincenzo.frascino@arm.com,
 Frank Rowand <frowand.list@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 James Morris <jmorris@namei.org>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "Serge E.
 Hallyn" <serge@hallyn.com>, devicetree@vger.kernel.org,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Prakhar Srivastava <prsriva@linux.microsoft.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Matthias Brugger <mbrugger@suse.com>, balajib@linux.microsoft.com,
 dmitry.kasatkin@gmail.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> On Thu, Feb 4, 2021 at 10:42 AM Lakshmi Ramasubramanian
> <nramas@linux.microsoft.com> wrote:
...
>> diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>> index d0e459bb2f05..51d2d8eb6c1b 100644
>> --- a/arch/powerpc/kexec/elf_64.c
>> +++ b/arch/powerpc/kexec/elf_64.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/kexec.h>
>>  #include <linux/libfdt.h>
>>  #include <linux/module.h>
>> +#include <linux/of.h>
>>  #include <linux/of_fdt.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>> @@ -32,7 +33,7 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>         unsigned int fdt_size;
>>         unsigned long kernel_load_addr;
>>         unsigned long initrd_load_addr = 0, fdt_load_addr;
>> -       void *fdt;
>> +       void *fdt = NULL;
>>         const void *slave_code;
>>         struct elfhdr ehdr;
>>         char *modified_cmdline = NULL;
>> @@ -103,18 +104,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>         }
>>
>>         fdt_size = fdt_totalsize(initial_boot_params) * 2;
>> -       fdt = kmalloc(fdt_size, GFP_KERNEL);
>> +       fdt = of_alloc_and_init_fdt(fdt_size);
>>         if (!fdt) {
>>                 pr_err("Not enough memory for the device tree.\n");
>>                 ret = -ENOMEM;
>>                 goto out;
>>         }
>> -       ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
>> -       if (ret < 0) {
>> -               pr_err("Error setting up the new device tree.\n");
>> -               ret = -EINVAL;
>> -               goto out;
>> -       }
>>
>>         ret = setup_new_fdt_ppc64(image, fdt, initrd_load_addr,
>
> The first thing this function does is call setup_new_fdt() which first
> calls of_kexec_setup_new_fdt(). (Note, I really don't understand the
> PPC code split. It looks like there's a 32-bit and 64-bit split, but
> 32-bit looks broken to me. Nothing ever calls setup_new_fdt() except
> setup_new_fdt_ppc64()).

I think that's because 32-bit doesn't support kexec_file_load().

cheers
