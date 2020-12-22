Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E82E0F58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 21:27:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0nv73zddzDqSL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 07:27:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=lkml@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
X-Greylist: delayed 449 seconds by postgrey-1.36 at bilbo;
 Wed, 23 Dec 2020 07:25:42 AEDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0nsL7357zDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 07:25:42 +1100 (AEDT)
Received: from [192.168.1.155] ([95.118.68.26]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N5FtF-1jtguL3EaD-0118EC; Tue, 22 Dec 2020 21:14:24 +0100
Subject: Re: [PATCH] arch: consolidate pm_power_off callback
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
References: <20201222184510.19415-1-info@metux.net>
 <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
Date: Tue, 22 Dec 2020 21:14:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:UpSPX5SjSxB2JTjoTNk4sWDtA2g9Ks1Ix8dKZhB/ESwn1jWfyhx
 EoQG8feaYKyQLnGwygV2naaePTeCvGl6q4M5FCoVvWDzd5IDw7I4++spAXF1Cn7hlWYDZ9i
 kl7Eptzr5sffhmk6uqoQvQuMaJH6WbEHZSp8VbRZESTCM8tqF2liTqVeSG60D5ct0JeRFXM
 C/vRJPf10ZNRyihx6OQ7A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kIBeTqqFv4s=:Xmnl+8s8Fq+y4p+IXUfWPP
 WsDsSyJUaBMEDcZ+USglwCSRmhvBLz/D/sbkdLf6MrIztnOhsHeu5Tiu2sZb+M3K4Y5c0C5hQ
 LjLUGXUi8y02KKlHW/NXxCxObXT4slskvicBM3uSwdj7VI4zDJqUBQPUCRkPRlyKsPzWK04pf
 rFmCVmfVZUHFyUjshrhoOXzi34jaFd4Yk5Hl/DM9jJIsJXAQ9pqjrxyivzixjl9N/b3y53biB
 ipDPVldK86MY4XXKwyv6xMlfX5qpTThtAxz5LQs2cU6sN2Qy6aBUCg8E0/CLD8Sgonwo9dvnO
 FmRPg6B4bdA9REC9pdpdIA787eTbIPmXgSfE2B0whqsYL/AHih10BXzmKvSwtXg9e68oWTpm/
 aWDNFxpwPGhIwdBahp0YlDaAZKE85LZ3kF05fDFAlABVlmKD9LXD5ku34A0o/
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.12.20 19:54, Geert Uytterhoeven wrote:

Hi,

> On Tue, Dec 22, 2020 at 7:46 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
>> Move the pm_power_off callback into one global place and also add an
>> function for conditionally calling it (when not NULL), in order to remove
>> code duplication in all individual archs.
>>
>> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> 
> Thanks for your patch!
> 
>> --- a/arch/alpha/kernel/process.c
>> +++ b/arch/alpha/kernel/process.c
>> @@ -43,12 +43,6 @@
>>  #include "proto.h"
>>  #include "pci_impl.h"
>>
>> -/*
>> - * Power off function, if any
>> - */
>> -void (*pm_power_off)(void) = machine_power_off;
> 
> Assignments like these are lost in the conversion.

Yes, but this doesn't seem to be ever called anyways. (in arch/alpha)
And, BTW, letting it point to machine_power_off() doesn't make much
sense, since it's the arch's machine_power_off() function, who're
calling pm_power_off().

Actually, we could remove pm_power_off completely from here, assuming
nobody would *build* any drivers that register themselves into
pm_power_off.

If you feel better with it, I could post a patch that just removes
pm_power_off from arch/alpha.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
