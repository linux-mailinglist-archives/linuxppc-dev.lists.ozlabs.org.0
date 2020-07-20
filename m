Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070A226B49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 18:41:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9SD94NzBzDqW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 02:41:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9S8403zyzDqcy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 02:37:52 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B9S7l1yGRz9vBmf;
 Mon, 20 Jul 2020 18:37:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mmmn_e8N6gsm; Mon, 20 Jul 2020 18:37:39 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B9S7l19kpz9vBmS;
 Mon, 20 Jul 2020 18:37:39 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 4C08A2493; Mon, 20 Jul 2020 18:39:00 +0200 (CEST)
Received: from 37-164-23-27.coucou-networks.fr
 (37-164-23-27.coucou-networks.fr [37.164.23.27]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Mon, 20 Jul 2020 18:39:00 +0200
Date: Mon, 20 Jul 2020 18:39:00 +0200
Message-ID: <20200720183900.Horde.y2dVSL93KA1P6bzz7IKxoA1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [powerpc:next-test 103/106]
 arch/powerpc/mm/book3s64/radix_pgtable.c:513:21: error: use of undeclared
 identifier 'SECTION_SIZE_BITS'
References: <202007190428.5Q47y2Gy%lkp@intel.com>
 <87zh7w108a.fsf@linux.ibm.com>
In-Reply-To: <87zh7w108a.fsf@linux.ibm.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> a =C3=A9crit=C2=A0:

> kernel test robot <lkp@intel.com> writes:
>
>> tree:=20=20=20=20
>>=20https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git=20=
=20
>>=20next-test
>> head:   5fed3b3e21db21f9a7002426f456fd3a8a8c0772
>> commit: 21407f39b9d547da527ad5224c4323e1f62bb514 [103/106]=20=20
>>=20powerpc/mm/radix: Create separate mappings for hot-plugged memory
>> config: powerpc-randconfig-r016-20200719 (attached as .config)
>> compiler: clang version 12.0.0=20=20
>>=20(https://github.com/llvm/llvm-project=20=20
>>=20ed6b578040a85977026c93bf4188f996148f3218)
>> reproduce (this is a W=3D1 build):
>>         wget=20=20
>>=20https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cro=
ss -O=20=20
>>=20~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install powerpc cross compiling tool for clang build
>>         # apt-get install binutils-powerpc-linux-gnu
>>         git checkout 21407f39b9d547da527ad5224c4323e1f62bb514
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross=
=20=20
>>=20ARCH=3Dpowerpc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> arch/powerpc/mm/book3s64/radix_pgtable.c:513:21: error: use of=20=20
>>>>=20undeclared identifier 'SECTION_SIZE_BITS'
>>                    *mem_block_size =3D MIN_MEMORY_BLOCK_SIZE;
>>                                      ^
>>    include/linux/memory.h:24:43: note: expanded from macro=20=20
>>=20'MIN_MEMORY_BLOCK_SIZE'
>>    #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
>>                                              ^
>>    arch/powerpc/mm/book3s64/radix_pgtable.c:521:33: error: use of=20=20
>>=20undeclared identifier 'SECTION_SIZE_BITS'
>>            unsigned long mem_block_size =3D MIN_MEMORY_BLOCK_SIZE;
>>                                           ^
>>    include/linux/memory.h:24:43: note: expanded from macro=20=20
>>=20'MIN_MEMORY_BLOCK_SIZE'
>>    #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
>>                                              ^
>>    2 errors generated.
>>
>> vim +/SECTION_SIZE_BITS +513 arch/powerpc/mm/book3s64/radix_pgtable.c
>>
>>    494
>>    495	static int __init probe_memory_block_size(unsigned long=20=20
>>=20node, const char *uname, int
>>    496						  depth, void *data)
>>    497	{
>>    498		unsigned long *mem_block_size =3D (unsigned long *)data;
>>    499		const __be64 *prop;
>>    500		int len;
>>    501
>>    502		if (depth !=3D 1)
>>    503			return 0;
>>    504
>>    505		if (strcmp(uname, "ibm,dynamic-reconfiguration-memory"))
>>    506			return 0;
>>    507
>>    508		prop =3D of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
>>    509		if (!prop || len < sizeof(__be64))
>>    510			/*
>>    511			 * Nothing in the device tree
>>    512			 */
>>  > 513			*mem_block_size =3D MIN_MEMORY_BLOCK_SIZE;
>>    514		else
>>    515			*mem_block_size =3D be64_to_cpup(prop);
>>    516		return 1;
>>    517	}
>>    518
>>
>
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c=20=20
>=20b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index bba45fc0b7b2..c5bf2ef73c36 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -492,6 +492,7 @@ static int __init=20=20
>=20radix_dt_scan_page_sizes(unsigned long node,
>  	return 1;
>  }
>
> +#ifdef CONFIG_MEMORY_HOTPLUG
>  static int __init probe_memory_block_size(unsigned long node, const=20=
=20
>=20char *uname, int
>  					  depth, void *data)
>  {
> @@ -532,6 +533,15 @@ static unsigned long radix_memory_block_size(void)
>  	return mem_block_size;
>  }
>
> +#else   /* CONFIG_MEMORY_HOTPLUG */
> +
> +static unsigned long radix_memory_block_size(void)
> +{
> +	return 1UL * 1024 * 1024 * 1024;

Use SZ_1G instead ?

Christophe

> +}
> +
> +#endif /* CONFIG_MEMORY_HOTPLUG */
> +
>
>  void __init radix__early_init_devtree(void)
>  {
> --
> 2.26.2
>
>
> -aneesh


