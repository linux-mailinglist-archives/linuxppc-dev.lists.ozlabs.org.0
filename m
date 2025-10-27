Return-Path: <linuxppc-dev+bounces-13334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838FC0E18B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 14:38:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwF2q0L4Qz2ytT;
	Tue, 28 Oct 2025 00:38:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761572322;
	cv=none; b=RZomRZcOJFbDXjbdWndwZs1WS0FnM2bvfTEHE62EvkYP0elbKt0bV4ifXnMaxZkA3fC82OyGH67ioYUCEaRdBJgcPdXmo71z4hu5N5kWhfalgAZ12FI46Ssl3bqOEV3hhPvSpfjk/MeXQhr5pOIwyT5ED+axo0y2Es1pY+uZXGQsa3vV/WbmnJqw9D9nV3NGfOovX1MS5U4tCQToEjrDeUia7KEbG39CtQuNAUD0SfgR5Q2wWFP2dURr3KcOoWjPkcsc25ZAm9Rdci2cG/vFun3XFOpe3vpQkEqDPFnlSBjB/OMCDvz0827I43nV0KrDgvsQFB8zLS7AmZFWsfi7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761572322; c=relaxed/relaxed;
	bh=Yg4tHkrWB8iD6I0E177EhXaJTLbrmVH+67p7EVU8ik0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gibYF3a46x6igz1ppKbsl2qikJThR9vtbawJSzDxyViZ5FlqjFFTtz6obKFVQOpqOwisN2jaACnvd5hWlxBo7j02m5mkZvhP0qdJxLv+XpnjQhLRuQprnJGRmqKoeck04r7ukR7Ecud4DMRGTFXpuzPxNvnvoVZOlei73f5NKkTdt78jYUWtxsjBHycFyUPz/r2MhJeSyLcP6hfdCzVn8tA03yynQWUiJurez7GeJaDsBtMIZbaDo6BGeuP8oifkjvlT6VhiHSLfXtBqxsUPut7Gn/NARmSrK2UOAO4pxwLbJ0DYWHelvMd7nxPbwbi+1ijK/0gHeDeoS/Tfyi0sCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwF2n5g40z2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 00:38:41 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593A4175D;
	Mon, 27 Oct 2025 06:38:02 -0700 (PDT)
Received: from [10.57.68.196] (unknown [10.57.68.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD233F673;
	Mon, 27 Oct 2025 06:38:02 -0700 (PDT)
Message-ID: <1db69026-199c-4cee-bb3b-1217f8a3afad@arm.com>
Date: Mon, 27 Oct 2025 14:38:00 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Woodhouse <dwmw2@infradead.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <6ed9f404-9939-4e9f-b5aa-4253bef46df1@arm.com>
 <7324616a8d2631aa8132f725f9f6551e3e6b21dd.camel@infradead.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <7324616a8d2631aa8132f725f9f6551e3e6b21dd.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/10/2025 17:17, David Woodhouse wrote:
> On Fri, 2025-10-24 at 17:05 +0200, Kevin Brodsky wrote:
>> On 24/10/2025 16:47, David Woodhouse wrote:
>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>> again.
>>>>>
>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>> state when switching to the new task, instead of using a separate
>>>>> TIF flag.
>>>>>
>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>> ---
>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>> folks.
>>> I know tglx has shouted at me in the past for precisely this reminder,
>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>> to actually run Xen? Has this been boot tested?
>> I considered boot-testing a Xen guest (considering the Xen-specific
>> changes in this series), but having no idea how to go about it I quickly
>> gave up... Happy to follow instructions :)
> https://qemu-project.gitlab.io/qemu/system/i386/xen.html covers booting
> Xen HVM guests, and near the bottom PV guests too (for which you do
> need a copy of Xen to run in QEMU with '--kernel xen', and your
> distro's build should suffice for that).
>
> Let me know if you have any trouble. Here's a sample command line which
> works here...
>
> qemu-system-x86_64 -display none --accel kvm,xen-version=0x40011,kernel-irqchip=split -drive file=/var/lib/libvirt/images/fedora28.qcow2,if=xen -kernel ~/git/linux-2.6/arch/x86/boot/bzImage -append "root=/dev/xvda1 console=ttyS0" -serial mon:stdio

Thanks this is helpful! Unfortunately lazy_mmu is only used in the PV
case, so I'd need to run a PV guest. And the distro I'm using (Arch
Linux) does not have a Xen package :/ It can be built from source from
the AUR but that looks rather involved. Are there some prebuilt binaries
I could grab and just point QEMU to?

- Kevin

