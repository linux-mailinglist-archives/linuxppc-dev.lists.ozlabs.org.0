Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B868A6A1F26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 16:59:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNZN94D3Qz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 02:59:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IV+x2SOK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=bjorn@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IV+x2SOK;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNZMC4jSxz3blJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Feb 2023 02:59:03 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2171A618E6;
	Fri, 24 Feb 2023 15:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118FDC433D2;
	Fri, 24 Feb 2023 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677254335;
	bh=rRfXjsGBMvvnDz60uwLB5dc9ju4oNbQeuN0GLhjFFZk=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=IV+x2SOKujlDxRkpOOclYLhRMxavxs2ZgAVNSvw7w90V9xvyuyFfsJCv80gYcOG2p
	 A4TsrQ/qWG2iKNVl3avpevUIt5GA93ovI/qxOn7KRfjQxoOnikKjPiXeR7hhdclS6q
	 dqmICBshEsrCnUZnXi2fTr77wbblb1vHL/rZvDQG8+JRWHjmvTQn465vrIBEOHJ7Iz
	 OcdwuhdpCS1R/LJKz0LToyAjRK19HbZPcprjDc1e+B3ESMEvkoWdKClgQQu+6mliia
	 B68A719Xz9UxYpvtgkDRGcfVlkhGZKsdVyehclJsK+pzSytz6pbulYjyBSnzYllZVj
	 F5Yvnz7APGcSQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, nathan@kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
 ndesaulniers@google.com
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com>
 <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
Date: Fri, 24 Feb 2023 16:58:52 +0100
Message-ID: <877cw7dphf.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexandre Ghiti <alex@ghiti.fr> writes:

> +cc linux-kbuild, llvm, Nathan, Nick
>
> On 2/15/23 15:36, Alexandre Ghiti wrote:
>> From: Alexandre Ghiti <alex@ghiti.fr>
>>
>> This config allows to compile 64b kernel as PIE and to relocate it at
>> any virtual address at runtime: this paves the way to KASLR.
>> Runtime relocation is possible since relocation metadata are embedded in=
to
>> the kernel.
>>
>> Note that relocating at runtime introduces an overhead even if the
>> kernel is loaded at the same address it was linked at and that the compi=
ler
>> options are those used in arm64 which uses the same RELA relocation
>> format.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/riscv/Kconfig              | 14 +++++++++
>>   arch/riscv/Makefile             |  7 +++--
>>   arch/riscv/kernel/efi-header.S  |  6 ++--
>>   arch/riscv/kernel/vmlinux.lds.S | 10 ++++--
>>   arch/riscv/mm/Makefile          |  4 +++
>>   arch/riscv/mm/init.c            | 54 ++++++++++++++++++++++++++++++++-
>>   6 files changed, 87 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index e2b656043abf..e0ee7ce4b2e3 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -544,6 +544,20 @@ config COMPAT
>>=20=20=20
>>   	  If you want to execute 32-bit userspace applications, say Y.
>>=20=20=20
>> +config RELOCATABLE
>> +	bool "Build a relocatable kernel"
>> +	depends on MMU && 64BIT && !XIP_KERNEL
>> +	help
>> +          This builds a kernel as a Position Independent Executable (PI=
E),
>> +          which retains all relocation metadata required to relocate the
>> +          kernel binary at runtime to a different virtual address than =
the
>> +          address it was linked at.
>> +          Since RISCV uses the RELA relocation format, this requires a
>> +          relocation pass at runtime even if the kernel is loaded at the
>> +          same address it was linked at.
>> +
>> +          If unsure, say N.
>> +
>>   endmenu # "Kernel features"
>>=20=20=20
>>   menu "Boot options"
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 82153960ac00..97c34136b027 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -7,9 +7,12 @@
>>   #
>>=20=20=20
>>   OBJCOPYFLAGS    :=3D -O binary
>> -LDFLAGS_vmlinux :=3D
>> +ifeq ($(CONFIG_RELOCATABLE),y)
>> +	LDFLAGS_vmlinux +=3D -shared -Bsymbolic -z notext -z norelro
>> +	KBUILD_CFLAGS +=3D -fPIE
>> +endif
>>   ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>> -	LDFLAGS_vmlinux :=3D --no-relax
>> +	LDFLAGS_vmlinux +=3D --no-relax
>>   	KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>>   	CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D8
>>   endif
>> diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-head=
er.S
>> index 8e733aa48ba6..f7ee09c4f12d 100644
>> --- a/arch/riscv/kernel/efi-header.S
>> +++ b/arch/riscv/kernel/efi-header.S
>> @@ -33,7 +33,7 @@ optional_header:
>>   	.byte	0x02					// MajorLinkerVersion
>>   	.byte	0x14					// MinorLinkerVersion
>>   	.long	__pecoff_text_end - efi_header_end	// SizeOfCode
>> -	.long	__pecoff_data_virt_size			// SizeOfInitializedData
>> +	.long	__pecoff_data_virt_end - __pecoff_text_end	// SizeOfInitializedD=
ata
>>   	.long	0					// SizeOfUninitializedData
>>   	.long	__efistub_efi_pe_entry - _start		// AddressOfEntryPoint
>>   	.long	efi_header_end - _start			// BaseOfCode
>> @@ -91,9 +91,9 @@ section_table:
>>   		IMAGE_SCN_MEM_EXECUTE			// Characteristics
>>=20=20=20
>>   	.ascii	".data\0\0\0"
>> -	.long	__pecoff_data_virt_size			// VirtualSize
>> +	.long	__pecoff_data_virt_end - __pecoff_text_end	// VirtualSize
>>   	.long	__pecoff_text_end - _start		// VirtualAddress
>> -	.long	__pecoff_data_raw_size			// SizeOfRawData
>> +	.long	__pecoff_data_raw_end - __pecoff_text_end	// SizeOfRawData
>>   	.long	__pecoff_text_end - _start		// PointerToRawData
>>=20=20=20
>>   	.long	0					// PointerToRelocations
>> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux=
.lds.S
>> index 4e6c88aa4d87..8be2de3be08c 100644
>> --- a/arch/riscv/kernel/vmlinux.lds.S
>> +++ b/arch/riscv/kernel/vmlinux.lds.S
>> @@ -122,9 +122,15 @@ SECTIONS
>>   		*(.sdata*)
>>   	}
>>=20=20=20
>> +	.rela.dyn : ALIGN(8) {
>> +		__rela_dyn_start =3D .;
>> +		*(.rela .rela*)
>> +		__rela_dyn_end =3D .;
>> +	}
>> +
>
>
> So I realized those relocations would be better in the init section so=20
> we can get rid of them at some point. So I tried the following:
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S=20
> b/arch/riscv/kernel/vmlinux.lds.S
> index 7ac215467fd5..6111023a89ef 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -93,6 +93,12 @@ SECTIONS
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(.rel.dyn*)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .rela.dyn : ALIGN(8) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 __rela_dyn_start =3D .;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *(.rela .rela*)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 __rela_dyn_end =3D .;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __init_data_end =3D .;
>
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . =3D ALIGN(8);
> @@ -119,12 +125,6 @@ SECTIONS
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *(.sdata*)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .rela.dyn : ALIGN(8) {
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 __rela_dyn_start =3D .;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 *(.rela .rela*)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 __rela_dyn_end =3D .;
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> -
>  =C2=A0#ifdef CONFIG_EFI
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pecoff_edata_padding : { BYT=
E(0); . =3D=20
> ALIGN(PECOFF_FILE_ALIGNMENT); }
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __pecoff_data_raw_end =3D ABS=
OLUTE(.);
>
>
> But then all the relocations in vmlinux end up being null:
>
> vmlinux:=C2=A0=C2=A0=C2=A0=C2=A0 file format elf64-littleriscv
>
> $ riscv64-linux-gnu-objdump -R vmlinux
>
> DYNAMIC RELOCATION RECORDS
> OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 VALUE
> 0000000000000000 R_RISCV_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ABS*
> 0000000000000000 R_RISCV_NONE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *ABS*
> ....
>
>  =C2=A0I also noticed that re-linking vmlinux with the same command right=
=20
> after works (ie, the relocations are now valid):
>
> $ riscv64-linux-gnu-objdump -R vmlinux
>
> vmlinux:=C2=A0=C2=A0=C2=A0=C2=A0 file format elf64-littleriscv
>
> DYNAMIC RELOCATION RECORDS
> OFFSET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TYPE=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 VALUE
> ffffffff82600718 R_RISCV_RELATIVE=C2=A0 *ABS*-0x000000007d9ff8e8
> ffffffff82600720 R_RISCV_RELATIVE=C2=A0 *ABS*-0x000000007d9ff8e8
> ...
>
> Below is the command used to generate this working vmlinux:
>
> riscv64-unknown-linux-gnu-ld -melf64lriscv -z noexecstack=20
> --no-warn-rwx-segments -shared -Bsymbolic -z notext -z norelro=20
> --no-relax --build-id=3Dsha1 --script=3D./arch/riscv/kernel/vmlinux.lds=20
> -Map=3Dvmlinux.map -o vmlinux --whole-archive vmlinux.a .vmlinux.export.o=
=20
> init/version-timestamp.o --no-whole-archive --start-group=20
> ./drivers/firmware/efi/libstub/lib.a --end-group .tmp_vmlinux.kallsyms3.o
>
> I tried a lot of things, but I struggle to understand, does anyone have=20
> any idea? FYI, the same problem happens with LLVM.

Don't ask me *why*, but adding --emit-relocs to your linker flags solves
"the NULL .rela.dyn" both for GCC and LLVM.

The downside is that you end up with a bunch of .rela cruft in your
vmlinux.


Bj=C3=B6rn
