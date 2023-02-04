Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7795568A8F8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 09:31:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P85Mh1xfCz3bjy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 19:31:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pIZNspfU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pIZNspfU;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P85Ll4Jvtz3cR7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 19:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JTCZHXV+s4OD939rIaoVv+s6pEWFUbOEql1NUxVw+Xw=; b=pIZNspfUELJsBHH8Hqqv1hlxEl
	1NrRI8h14L+z3/0qmVW9a79jy4eN3Zo6Uv0h1eWPM0xhncNHrUa6d9V+tFTp57oyzvtV1tA4Owipw
	P2oshvh2lTSsTIrVtu0i6YJBeBAOl2vI8WS75YMgoffXwwmrnAok8zRWQmZorKNnYcump54ue+a/J
	YfwzV4+I4EdlkdDAuICyjpIr6aYEvNBDPC2FF0mlPsxsu5DVo+q1XhnlzEeK1l1wjM0fwtsfY2u1i
	t4wB36QFPtM0FUSP1ghLuLRzPoRzkA2cQL/YmMWuFd4+cHLY/3gS8WgeusBVyHQGckDtaMiyiGEnf
	Yx1XrhSQ==;
Received: from [2601:1c2:d00:6a60::9526]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pODw8-004jTH-SL; Sat, 04 Feb 2023 08:30:16 +0000
Message-ID: <b212bec9-27c5-6be0-d33e-e23978a322a2@infradead.org>
Date: Sat, 4 Feb 2023 00:30:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 15/16] objtool/powerpc: Enable objtool to be built on
 ppc
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-16-sv@linux.ibm.com>
 <33924523-5437-eb9a-116a-8e249ce99bd2@csgroup.eu>
 <b1079e99-c7ae-71f1-d578-80270adf44e7@infradead.org>
 <756321f5-9417-2d78-679a-1847fa18ff8a@infradead.org>
In-Reply-To: <756321f5-9417-2d78-679a-1847fa18ff8a@infradead.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "Elliott, Robert \(Servers\)" <elliott@hpe.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/4/23 00:21, Randy Dunlap wrote:
> 
> 
> On 2/4/23 00:19, Randy Dunlap wrote:
>> Hi--
>>
>> On 8/29/22 23:41, Christophe Leroy wrote:
>>>
>>>
>>> Le 29/08/2022 à 07:52, Sathvika Vasireddy a écrit :
>>>> This patch adds [stub] implementations for required
>>>> functions, inorder to enable objtool build on powerpc.
>>>
>>> Not all powerpc it seems, see below
>>>
>>
>> When cross-compiling PPC32 (on x86_64), I get 3600+ of these:
>>
>> /bin/sh: line 1: ./tools/objtool/objtool: No such file or directory
>> /bin/sh: line 1: ./tools/objtool/objtool: No such file or directory
>> /bin/sh: line 1: ./tools/objtool/objtool: No such file or directory
>>
>> Is there some way that objtool should work when cross-compiling?
>>
> 
> Oops. Its build failed. I seem to be missing header file(s)
> and possibly a library.
> I'll check on those...
> 

It's complaining about libelf.h but I have that, so I don't know where
it is looking other than /usr/include/libelf.h, which exists.
Maybe the tool isn't setup (ready) for cross-compiling?


Here's the build output for objtool:

<stdin>:1:10: fatal error: libelf.h: No such file or directory
compilation terminated.
elf.c: In function ‘read_sections’:
elf.c:273:9: error: ‘elf_getshnum’ is deprecated [-Werror=deprecated-declarations]
  273 |         if (elf_getshdrnum(elf->elf, &sections_nr)) {
      |         ^~
In file included from /usr/include/gelf.h:32,
                 from /work/lnx/next/linux-next-20230203/tools/objtool/include/objtool/elf.h:10,
                 from elf.c:22:
/usr/include/libelf.h:310:12: note: declared here
  310 | extern int elf_getshnum (Elf *__elf, size_t *__dst)
      |            ^~~~~~~~~~~~
elf.c:278:9: error: ‘elf_getshstrndx’ is deprecated [-Werror=deprecated-declarations]
  278 |         if (elf_getshdrstrndx(elf->elf, &shstrndx)) {
      |         ^~
/usr/include/libelf.h:322:12: note: declared here
  322 | extern int elf_getshstrndx (Elf *__elf, size_t *__dst)
      |            ^~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[4]: *** [/work/lnx/next/linux-next-20230203/tools/build/Makefile.build:96: /work/lnx/next/linux-next-20230203/PPC32/tools/objtool/elf.o] Error 1

make[3]: *** [Makefile:66: /work/lnx/next/linux-next-20230203/PPC32/tools/objtool/objtool-in.o] Error 2


Thanks.
-- 
~Randy
