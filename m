Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE4B18B218
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 12:08:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jkfm4QP1zDr27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 22:08:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48jkcb4zlRzDr8q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 22:06:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4BB731B;
 Thu, 19 Mar 2020 04:06:31 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2A993F305;
 Thu, 19 Mar 2020 04:06:25 -0700 (PDT)
Subject: Re: [PATCH -v2] treewide: Rename "unencrypted" to "decrypted"
To: Borislav Petkov <bp@alien8.de>, Christoph Hellwig <hch@lst.de>
References: <20200317111822.GA15609@zn.tnic> <20200319101657.GB13073@zn.tnic>
 <20200319102011.GA3617@lst.de> <20200319102834.GC13073@zn.tnic>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8d6d3b6c-7e4e-7d9e-3e19-38f7d4477c72@arm.com>
Date: Thu, 19 Mar 2020 11:06:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200319102834.GC13073@zn.tnic>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[since this is in my inbox...]

On 2020-03-19 10:28 am, Borislav Petkov wrote:
> On Thu, Mar 19, 2020 at 11:20:11AM +0100, Christoph Hellwig wrote:
>> I thought we agreed that decrypted is absolutely the wrong term.
> 
> I don't think we did. At least I don't know where we did that.
> 
>> So NAK - if you want to change things it needs to go the other way.
> 
> We are already using "decrypted" everywhere in arch/x86/. Changing that
> would be a *lot* more churn.
> 
> And it is just a term, for chrissakes, to denote memory which is not
> encrypted. And it would make our lifes easier if we had only *two* terms
> instead of three or more. Especially if the concept we denote with this
> is a binary one: encrypted memory and *not* encrypted memory.

Let me add another vote from a native English speaker that "unencrypted" 
is the appropriate term to imply the *absence* of encryption, whereas 
"decrypted" implies the *reversal* of applied encryption.

Naming things is famously hard, for good reason - names are *important* 
for understanding. Just because a decision was already made one way 
doesn't mean that that decision was necessarily right. Churning one area 
to be consistently inaccurate just because it's less work than churning 
another area to be consistently accurate isn't really the best excuse.

Robin.
