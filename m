Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09114C94F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 12:12:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48715r05qXzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 22:12:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::f44; helo=mail-qv1-xf44.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=VJ8O0yAW; dkim-atps=neutral
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48713c6Y4rzDq9s
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 22:10:02 +1100 (AEDT)
Received: by mail-qv1-xf44.google.com with SMTP id p2so7786208qvo.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 03:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Rdg0eRE4Rs/tOFVa1nKjmhUlRl2NKOMw55LDI32OSOc=;
 b=VJ8O0yAWe2cXlzCT1mNhPcxqqFeCKhkmfpyAWfq4oYf0VFJ3BC4CHwckKloSIN0EXg
 v5DJKr5FfAbivbt4bmiixvzRDbgAX4zdyDY3Z7zJENEidZcJ7qqrRNPRT7y2J7WlkuAW
 ewW0RwL5VtfuLoAx485pn8lnifxaC15SKUc8607bIEelaurpzyi5k7hkoO7yxuV3yb4d
 hRnFShBFGIfDCfAPvTiAO0yxsNG/bViMXer6WnGqfUy8ySyDKJC0Q4H5WpZ3O51VPBPp
 7I+z1htSl8yn6YxMeGxxXZDeFn0jXFFJZ2cfPzD73Zg0RLbASOFkEZ8dO14ZZO1X4gAp
 ELnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Rdg0eRE4Rs/tOFVa1nKjmhUlRl2NKOMw55LDI32OSOc=;
 b=eC6g7rkDkDqli8K3XZnIXrG54sj8LEwiAKUVp8+IKk/psTJOjmWRLluUR93IQ1Clua
 T9okRuwiND9bHcr54r/aFhatoezQhDeUSK5NCcU5vlE2kXVPUjEj8eZtWE38weEtSxv2
 5f26fFZIgSnWNybMwtMzEDzT+fZJU0vAc6Do8xrIVF0MHbS/0gN0z5A5sfy9hEuJ264G
 39srYTf07pXAFdGVW5dK86WH2/d5PFlQ0ybJXloMf9uW4FllBpgCROkreRRH3yAa5epH
 VuWMnoIdvXR38psmqS8NpBd5+HyOtTTsU5h5Ccs1eiGi1HTeLLAW0dhkUL5MyL80vqOK
 rukg==
X-Gm-Message-State: APjAAAUqMagPlUF+XvtjWkGAwo7aWqDc85yeFEaA03JIeB8Kx+/3YtZz
 Z6Ot1tBVd6AnnacKtA46RF4JDQ==
X-Google-Smtp-Source: APXvYqwSo4IdEjgBam29nZ7sdiS8q0FjVa1Z465Vm5JMHa3pbBcFWxe+wcLkVFwcg7WF0RMbdVCuCg==
X-Received: by 2002:a0c:9d4f:: with SMTP id n15mr22120161qvf.194.1580296199181; 
 Wed, 29 Jan 2020 03:09:59 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id v7sm882184qtk.89.2020.01.29.03.09.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Jan 2020 03:09:58 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
In-Reply-To: <20200129103640.GA668562@arrakis.emea.arm.com>
Date: Wed, 29 Jan 2020 06:09:56 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <50B7EFFE-1FF0-4B16-84A1-D851052B18B4@lca.pw>
References: <20200128174709.GK655507@arrakis.emea.arm.com>
 <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
 <20200129103640.GA668562@arrakis.emea.arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vlastimil Babka <vbabka@suse.cz>, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 29, 2020, at 5:36 AM, Catalin Marinas <catalin.marinas@arm.com> =
wrote:
>=20
> On Tue, Jan 28, 2020 at 02:07:10PM -0500, Qian Cai wrote:
>> On Jan 28, 2020, at 12:47 PM, Catalin Marinas =
<catalin.marinas@arm.com> wrote:
>>> The primary goal here is not finding regressions but having clearly
>>> defined semantics of the page table accessors across architectures. =
x86
>>> and arm64 are a good starting point and other architectures will be
>>> enabled as they are aligned to the same semantics.
>>=20
>> This still does not answer the fundamental question. If this test is
>> simply inefficient to find bugs,
>=20
> Who said this is inefficient (other than you)?

Inefficient of finding bugs. It said only found a bug or two in its =
lifetime?

>=20
>> who wants to spend time to use it regularly?=20
>=20
> Arch maintainers, mm maintainers introducing new macros or assuming
> certain new semantics of the existing macros.
>=20
>> If this is just one off test that may get running once in a few years
>> (when introducing a new arch), how does it justify the ongoing cost =
to
>> maintain it?
>=20
> You are really missing the point. It's not only for a new arch but
> changes to existing arch code. And if the arch code churn in this area
> is relatively small, I'd expect a similarly small cost of maintaining
> this test.
>=20
> If you only turn DEBUG_VM on once every few years, don't generalise =
this
> to the rest of the kernel developers (as others pointed out, this test
> is default y if DEBUG_VM).

Quite the opposite, I am running DEBUG_VM almost daily for regression
workload while I felt strongly this thing does not add any value mixing =
there.

So, I would suggest to decouple this away from DEBUG_VM, and clearly
document that this test is not something intended for automated =
regression
workloads, so those people don=E2=80=99t need to waste time running =
this.

>=20
> Anyway, I think that's a pointless discussion, so not going to reply
> further (unless you have technical content to add).
>=20
> --=20
> Catalin

