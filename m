Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC83B24A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 19:30:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VN2Q3XS1zF4Mj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 03:30:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=neo-zeon.de
 (client-ip=96.90.244.226; helo=neo-zeon.de; envelope-from=cam@neo-zeon.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neo-zeon.de
Received: from neo-zeon.de (neo-zeon.de [96.90.244.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VN03297kzF5nM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 03:28:34 +1000 (AEST)
Received: from [192.168.0.55] (ukyo.nerv.lan [192.168.0.55])
 (authenticated bits=0)
 by neo-zeon.de (8.15.2/8.15.2) with ESMTPSA id x8DHSQTP078663
 (version=TLSv1.2 cipher=AES128-SHA bits=128 verify=NO);
 Fri, 13 Sep 2019 10:28:27 -0700 (PDT) (envelope-from cam@neo-zeon.de)
Subject: Re: [Bug 204789] New: Boot failure with more than 256G of memory
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <bug-204789-27@https.bugzilla.kernel.org/>
 <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
 <875zlw7q5s.fsf@linux.ibm.com> <87zhj85lac.fsf@linux.ibm.com>
 <a18615a4-be8b-4df0-addb-7841567923f6@neo-zeon.de>
 <28de8cb6-3213-56aa-8ed6-fbdb109ab3df@linux.ibm.com>
From: Cameron Berkenpas <cam@neo-zeon.de>
Message-ID: <e45ab4aa-202f-b98a-e9cf-8945ea9391a8@neo-zeon.de>
Date: Fri, 13 Sep 2019 10:28:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <28de8cb6-3213-56aa-8ed6-fbdb109ab3df@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running against the kernel I built against 0034d395f89d and the problem 
is still there.

However, running against the kernel I built against the previous commit, 
a35a3c6f6065, and the system boots.

This being due to 0034d395f89d confirmed.

Thanks!

On 9/13/19 9:13 AM, Aneesh Kumar K.V wrote:
> On 9/13/19 8:35 PM, Cameron Berkenpas wrote:
>> Yep, the box comes up now, but with 256G memory as expected.
>>
>> I'll get back to you on when I'll be able to bisect.
>>
>> Thanks!
>
> I am sure this is due to
>
> commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions 
> in the same 0xc range"),
>
> We reduced the linear map range for 4K page size to 16TB there.
>
>
> -aneesh

