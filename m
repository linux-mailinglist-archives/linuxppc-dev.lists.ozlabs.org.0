Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EE324D12C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 11:11:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXwkf31PdzDrBq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 19:11:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BXwhc5BnrzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 19:10:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80B1F30E;
 Fri, 21 Aug 2020 02:10:03 -0700 (PDT)
Received: from [10.163.67.49] (unknown [10.163.67.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECBDE3F66B;
 Fri, 21 Aug 2020 02:10:01 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <87tuwyvjei.fsf@linux.ibm.com> <856eb6d7-9c09-728e-b374-d787145ac052@arm.com>
 <46cc2987-0d1e-f8e8-ecaf-2d246b33413e@linux.ibm.com>
 <6927a5cf-4100-e43e-6aba-5d7bc0533276@arm.com>
 <9b01e909-e6c3-1e6d-ae83-249bdab84ece@linux.ibm.com>
 <b764dcea-94e8-d2a1-6c09-c33b9073b01c@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <4efec7bd-2dbc-7da3-eee6-f7cf71a89ba1@arm.com>
Date: Fri, 21 Aug 2020 14:39:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b764dcea-94e8-d2a1-6c09-c33b9073b01c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/21/2020 02:20 PM, Aneesh Kumar K.V wrote:
> 
>> Sure. I am hoping kernel test robot will pick this up. I did an x86 and about 19 different ppc config build with the series. The git tree above was pushed with that. Considering you authored the change i am wondering if you could help with checking other architecture (may be atleast arm variant)
>>
> 
> I updated the tree after a defconfig build on arch/arm64/s390/x86.  I will not be able to boot test them.
> 
> Can you help with boot testing on arm?

Did not see any obvious problem.
