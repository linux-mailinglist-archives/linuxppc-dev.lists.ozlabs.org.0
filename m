Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DF4B89F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 14:29:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzJj95pWdz3fYH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 00:29:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=RUtWJPgj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.22; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=RUtWJPgj; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzJgv4ctHz3f2Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 00:28:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645018096;
 bh=HwNrev1x9N/bAHozCMnHh0/SWdmQxawrVLg0m+YakW0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RUtWJPgj02d9RdJYQ7YoSVHPNgdJKkbQLGxH/3959fWlRoxCzs+SEUv8MhF9EIuSd
 UPOms99OagbeNHn9T2GREA/Kzg1CItzhmNQ9p1MZePz84ZabXDt6BIzIIZkLX4OEiL
 umm0oSmyex5vNBSnWFCgn2yRL7eID38JcE3sRZpk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.128.232]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNtF-1nz7c511Rd-00lnUS; Wed, 16
 Feb 2022 14:28:16 +0100
Message-ID: <7c557d0c-6718-4e16-29c6-8b75c704b773@gmx.de>
Date: Wed, 16 Feb 2022 14:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <202202150807.D584917D34@keescook>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <202202150807.D584917D34@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7WUZ8IdPRgrLzg2kYAsCubjhcGSsfWfnDerK+e6MsDTo0WVtSo1
 Qo1CSZAO42swRuv6lToQn2mbsuQy/pB029PlMs3UDpE+ADYKs4fY8RkSq6zythe/H0UD0qp
 PJiEhm1bu11UqjwgQDhFNERLa6KstnkZlTWu4pgSqsVGe95043DiptKYmRvLXMi+S5ig2G7
 A9mnu9SU2Bsce/RvmK/YQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HQlDLvllLB4=:zG9VjdQRhRW5zMKE35JAvQ
 sTaBZEmtmI9M5ryeCAdLypOUp+VWPjwhleh58s4Bx0MfvSQfMtggCwUjcI0R8FJVGQcyqOZIs
 gqHhsqvhwutFDRldf6md8zmmGtk6TwaVyquzZ1MCESW2SrE6zcGTymzFpltWz+Rdkdm1YFzoa
 lhTa5F+9uqsO8bDVGoqGaDUIiyihY5hNJSxdBLYV4ERtbrvekgcL3XZjnnhPOTyNx8JQ28Yjp
 4fK2TTtL0ghtJ4mnEmXuu4xsl/+m2AaqMf5GyF2X+Gss44eGD/xxCgtYJBPRBw4FbPSnQiUXK
 ESp0mlJlpOtqulWHrEWJSxblPFaZMQF80liBI30esPGycROuavhe7HL9FL0IPQjGywvwrnUQB
 YK+pU/QiiMlEJYmZdHT4tV65PWHI4/4wFVfWyEHguIml8zPF+yrR4FQ2LPLOEElJj2ZXmP1Il
 ptIbyziXpMsIbCltb1QduqrC2jpL8QzlTmh0AO3SaXvAkH12v5CYNAIjLx8CJ7BOOuQlzFA3b
 5EF70bAPJl1RszsfR54ncea2HR/kjLjsEjAAnlAyOPytQAbaWqQnzaoirFM9KCpaxCytx71Pk
 0Bb+Cvv81aE5/W0KggKYi9IITAtuxBRxtjjoHnTv0CuPXBKjqr8o7rKDbWNaeOBjVtsAXTBIE
 nfQiRXLcflgKsnrIhrvnwElHTrj4HOnt39TJRk7y3MuTYdx++/uvDNrsBEi4Sm8QW0ZPUCWWC
 5d0WWIxb+B84bK4DfWOp7hVVSl/WYpgWqH5b4hU2WVpaBhs3zjSNoE03rlVfqj8Plm/0XcYMn
 HKbc0j0eIXagEdOr/A8UnONn6xvHzDG6IlK86sNVMaW6miOMxkiqDf4AXt3RcD60mUBOpxWh6
 hovUfJj4ODRTGQeG6EIMT9I2fWf/qBJtPssP+L6yma1zYEBPucaJAUDCNTf14W8tDovm0ErnO
 U31rrGLF8j6wf/UYsXTNfyVbf6s0842T9tNF8uum82B211/ALU5kr2q7fOpyto8A6IZl1VN8I
 U/XrzPQALxcWCHwdRPHpc7x1H1HZuNVH/zyWx8sChgHXxjHJl2Os5vV4IHwWbTE/HLT+foop1
 IGBNEhLpIEk+tI=
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/15/22 17:07, Kees Cook wrote:
> On Tue, Feb 15, 2022 at 01:40:55PM +0100, Christophe Leroy wrote:
>> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
>> on those three architectures because LKDTM messes up function
>> descriptors with functions.
>>
>> This series does some cleanup in the three architectures and
>> refactors function descriptors so that it can then easily use it
>> in a generic way in LKDTM.
>
> Thanks for doing this! It looks good to me. :)

I endorse that.
Thank you, Christophe!

Acked-by: Helge Deller <deller@gmx.de>

Helge

> -Kees
>
>>
>> Changes in v4:
>> - Added patch 1 which Fixes 'sparse' for powerpc64le after wrong report=
 on previous series, refer https://github.com/ruscur/linux-ci/actions/runs=
/1351427671
>> - Exported dereference_function_descriptor() to modules
>> - Addressed other received comments
>> - Rebased on latest powerpc/next (5a72345e6a78120368fcc841b570331b6c5a5=
0da)
>>
>> Changes in v3:
>> - Addressed received comments
>> - Swapped some of the powerpc patches to keep func_descr_t renamed as s=
truct func_desc and remove 'struct ppc64_opd_entry'
>> - Changed HAVE_FUNCTION_DESCRIPTORS macro to a config item CONFIG_HAVE_=
FUNCTION_DESCRIPTORS
>> - Dropped patch 11 ("Fix lkdtm_EXEC_RODATA()")
>>
>> Changes in v2:
>> - Addressed received comments
>> - Moved dereference_[kernel]_function_descriptor() out of line
>> - Added patches to remove func_descr_t and func_desc_t in powerpc
>> - Using func_desc_t instead of funct_descr_t
>> - Renamed HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to HAVE_FUNCTION_DESCRIP=
TORS
>> - Added a new lkdtm test to check protection of function descriptors
>>
>> Christophe Leroy (13):
>>   powerpc: Fix 'sparse' checking on PPC64le
>>   powerpc: Move and rename func_descr_t
>>   powerpc: Use 'struct func_desc' instead of 'struct ppc64_opd_entry'
>>   powerpc: Remove 'struct ppc64_opd_entry'
>>   powerpc: Prepare func_desc_t for refactorisation
>>   ia64: Rename 'ip' to 'addr' in 'struct fdesc'
>>   asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS
>>   asm-generic: Define 'func_desc_t' to commonly describe function
>>     descriptors
>>   asm-generic: Refactor dereference_[kernel]_function_descriptor()
>>   lkdtm: Force do_nothing() out of line
>>   lkdtm: Really write into kernel text in WRITE_KERN
>>   lkdtm: Fix execute_[user]_location()
>>   lkdtm: Add a test for function descriptors protection
>>
>>  arch/Kconfig                             |  3 +
>>  arch/ia64/Kconfig                        |  1 +
>>  arch/ia64/include/asm/elf.h              |  2 +-
>>  arch/ia64/include/asm/sections.h         | 24 +-------
>>  arch/ia64/kernel/module.c                |  6 +-
>>  arch/parisc/Kconfig                      |  1 +
>>  arch/parisc/include/asm/sections.h       | 16 ++----
>>  arch/parisc/kernel/process.c             | 21 -------
>>  arch/powerpc/Kconfig                     |  1 +
>>  arch/powerpc/Makefile                    |  2 +-
>>  arch/powerpc/include/asm/code-patching.h |  2 +-
>>  arch/powerpc/include/asm/elf.h           |  6 ++
>>  arch/powerpc/include/asm/sections.h      | 29 ++--------
>>  arch/powerpc/include/asm/types.h         |  6 --
>>  arch/powerpc/include/uapi/asm/elf.h      |  8 ---
>>  arch/powerpc/kernel/module_64.c          | 42 ++++++--------
>>  arch/powerpc/kernel/ptrace/ptrace.c      |  6 ++
>>  arch/powerpc/kernel/signal_64.c          |  8 +--
>>  drivers/misc/lkdtm/core.c                |  1 +
>>  drivers/misc/lkdtm/lkdtm.h               |  1 +
>>  drivers/misc/lkdtm/perms.c               | 71 +++++++++++++++++++-----
>>  include/asm-generic/sections.h           | 15 ++++-
>>  include/linux/kallsyms.h                 |  2 +-
>>  kernel/extable.c                         | 24 +++++++-
>>  tools/testing/selftests/lkdtm/tests.txt  |  1 +
>>  25 files changed, 155 insertions(+), 144 deletions(-)
>>
>> --
>> 2.34.1
>>
>

