Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C539DBF8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:21:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZ0T1vvjzDqpk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HYyN1Xq2zDqnK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:19:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46HYyL5HWHz9sBF;
 Tue, 27 Aug 2019 13:19:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/fadump: sysfs for fadump memory reservation
In-Reply-To: <f8e9cbdd-1926-081d-c8e6-f9d55408fe51@linux.ibm.com>
References: <20190810175905.7761-1-sourabhjain@linux.ibm.com>
 <53311fa4-2cce-1eb6-1aae-0c835e06eb24@linux.ibm.com>
 <cf4fdb60-438c-bc4e-d759-1fbb27364c50@linux.ibm.com>
 <f53e4cfe-57cb-d8a6-385a-fa6243940573@linux.ibm.com>
 <f8e9cbdd-1926-081d-c8e6-f9d55408fe51@linux.ibm.com>
Date: Tue, 27 Aug 2019 13:19:35 +1000
Message-ID: <87sgpn2t2w.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: corbet@lwn.net, mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> On 26/08/19 4:14 PM, Sourabh Jain wrote:
>> On 8/26/19 3:46 PM, Sourabh Jain wrote:
>>> On 8/26/19 3:29 PM, Hari Bathini wrote:
>>>> On 10/08/19 11:29 PM, Sourabh Jain wrote:
>>>>> Add a sys interface to allow querying the memory reserved by
>>>>> fadump for saving the crash dump.
>>>>>
>>>>> Add an ABI doc entry for new sysfs interface.
>>>>>    - /sys/kernel/fadump_mem_reserved
>>>>>
>>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>>> ---
>>>>> Changelog:
>>>>> v1 -> v2:
>>>>>   - Added ABI doc for new sysfs interface.
>>>>>
>>>>> v2 -> v3:
>>>>>   - Updated the ABI documentation.
>>>>> ---
>>>>>
>>>>>  Documentation/ABI/testing/sysfs-kernel-fadump    |  6 ++++++
>>>>
>>>> Shouldn't this be Documentation/ABI/testing/sysfs-kernel-fadump_mem_reserved?
>> 
>> How about documenting fadump_mem_reserved and other sysfs attributes suggested
>> by you in a single file Documentation/ABI/testing/sysfs-kernel-fadump?
>
> I wouldn't mind that but please do check if it is breaking a convention..

AIUI a file named like that would hold the documentation for the files
inside a directory called /sys/kernel/fadump.

And in fact that's probably where these files should live, rather than
just dropped directly into /sys/kernel.

cheers
