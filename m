Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B721217CA36
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 02:13:28 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Z61d0sKKzDr0x
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Mar 2020 12:13:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=209.85.219.68; helo=mail-qv1-f68.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=EGv7Xx0m; dkim-atps=neutral
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Z60467XSzDqyb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Mar 2020 12:12:04 +1100 (AEDT)
Received: by mail-qv1-f68.google.com with SMTP id o18so1870375qvf.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2020 17:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EgkVlU+1chmZAdNkyF5q9aYrIAuysLZZez5WmPdEesQ=;
 b=EGv7Xx0mZhZufvegZpMUc+XHUkn93SE5ZYbqMRcl5l03s/x6c5RGn1Ma2qadFUAf7S
 mDQMjSqV0IMWb0LKZbXtHgPTizxmZGQTJdUUxxDOzRNaQofngetBXfwNZBmrbUir4STy
 e3xaR5vaUH0X/eG5wGlkW6iyRZ9+AVrlHBQUd8rTQK2YW8J6Zd2RLf0s/Z6jQ5Xya9vu
 aeJUNlgp7kS5lPRKKgCNzhDAIzhO4wqNELMKCmK5Pf7jkprIcuqhfAVWcp5Z+XuxcskU
 0FpMxIT78jjgIVAOm8sfqI2jqD5aX8zFE6cx/mP42YiyM5KNoK8iovEJATfquaQSZhHz
 6eAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=EgkVlU+1chmZAdNkyF5q9aYrIAuysLZZez5WmPdEesQ=;
 b=g8uB5tcItx7IBnCP/AdeqyyR+bjl2LqyNMUvdt+H73fdW0kR23NAlOi6Ig+d53CwYl
 CElWOavNByWD/Pw3zeL0PswL2xnrwoUtobmv/Ep8Viu2tZpzXrAdoM5GSyTwAFouNKw1
 F/vQrS8UNBCn4rTxHxSI12P5UFYLtPm6H2HNQ2OiK80SdpjZhajTkHVc4uT3Jznfg2+2
 +yRqMeYXLsBbof3yeYeA7FINpksJ+oV8/dgycwv8bnXnS0oTWH4g6NwT+qrqGwK75FDm
 nLOZTi7HvlizFvVS+ZKQ28sxnGYyFjyChgsNprKPUib5wUTQXweRs6D/S9DvwnCOYsS8
 84sQ==
X-Gm-Message-State: ANhLgQ2COkBBxFQ8JvzVmfiVrvw7egenchbpf5w0BpnIR0QgaDxXA042
 rpKkMHwOxUDozTJHLg964yNyvQ==
X-Google-Smtp-Source: ADFU+vsw52nux5Uc1WpPZ0fNtyFcwSVbVBgSYAhgVo8M+FINwP2UYIzF3QTk5i6KnfgTnuq5ecGdaA==
X-Received: by 2002:a0c:e401:: with SMTP id o1mr5556949qvl.19.1583543455511;
 Fri, 06 Mar 2020 17:10:55 -0800 (PST)
Received: from qians-mbp.fios-router.home
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id d35sm17605260qtc.21.2020.03.06.17.10.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Mar 2020 17:10:54 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
In-Reply-To: <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
Date: Fri, 6 Mar 2020 20:10:52 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C65A91AB-3F70-4120-893D-2751601C0F25@lca.pw>
References: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
 <CEEAD95E-D468-4C58-A65B-7E8AED91168A@lca.pw>
 <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Mar 6, 2020, at 7:56 PM, Anshuman Khandual =
<anshuman.khandual@arm.com> wrote:
>=20
>=20
>=20
> On 03/07/2020 06:04 AM, Qian Cai wrote:
>>=20
>>=20
>>> On Mar 6, 2020, at 7:03 PM, Anshuman Khandual =
<Anshuman.Khandual@arm.com> wrote:
>>>=20
>>> Hmm, set_pte_at() function is not preferred here for these tests. =
The idea
>>> is to avoid or atleast minimize TLB/cache flushes triggered from =
these sort
>>> of 'static' tests. set_pte_at() is platform provided and could/might =
trigger
>>> these flushes or some other platform specific synchronization stuff. =
Just
>>=20
>> Why is that important for this debugging option?
>=20
> Primarily reason is to avoid TLB/cache flush instructions on the =
system
> during these tests that only involve transforming different page table
> level entries through helpers. Unless really necessary, why should it
> emit any TLB/cache flush instructions ?
>=20
>>=20
>>> wondering is there specific reason with respect to the soft lock up =
problem
>>> making it necessary to use set_pte_at() rather than a simple =
WRITE_ONCE() ?
>>=20
>> Looks at the s390 version of set_pte_at(), it has this comment,
>> vmaddr);
>>=20
>> /*
>> * Certain architectures need to do special things when PTEs
>> * within a page table are directly modified.  Thus, the following
>> * hook is made available.
>> */
>>=20
>> I can only guess that powerpc  could be the same here.
>=20
> This comment is present in multiple platforms while defining =
set_pte_at().
> Is not 'barrier()' here alone good enough ? Else what exactly =
set_pte_at()

No, barrier() is not enough.

> does as compared to WRITE_ONCE() that avoids the soft lock up, just =
trying
> to understand.

I surely can spend hours to figure which exact things in set_pte_at() is =
necessary for
pte_clear() not to stuck, and then propose a solution and possible need =
to retest on
multiple arches. I am not sure if that is a good use of my time just to =
saving
a few TLB/cache flush on a debug kernel?=
