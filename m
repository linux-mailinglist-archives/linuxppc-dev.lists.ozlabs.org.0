Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8A3278CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 09:00:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpt475NL4z3d7f
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 19:00:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dpt3q2yQbz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 19:00:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1E031063;
 Mon,  1 Mar 2021 00:00:36 -0800 (PST)
Received: from [10.163.67.14] (unknown [10.163.67.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17F0A3F70D;
 Mon,  1 Mar 2021 00:00:33 -0800 (PST)
Subject: Re: [PATCH] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
To: Christoph Hellwig <hch@lst.de>
References: <1614577853-7452-1-git-send-email-anshuman.khandual@arm.com>
 <20210301062358.GA25761@lst.de>
 <89f2d77c-f4bc-8f7b-a6b0-1c04e422fb77@arm.com>
 <20210301075352.GA27659@lst.de>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d5fc741d-0c24-5b0f-c9b3-3a2be796ad79@arm.com>
Date: Mon, 1 Mar 2021 13:31:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210301075352.GA27659@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/1/21 1:23 PM, Christoph Hellwig wrote:
> On Mon, Mar 01, 2021 at 01:13:41PM +0530, Anshuman Khandual wrote:
>>> doesn't this need a 'if HUGETLB_PAGE'
>>
>> While making HUGETLB_PAGE_SIZE_VARIABLE a generic option, also made it
>> dependent on HUGETLB_PAGE. Should not that gate HUGETLB_PAGE_SIZE_VARIABLE
>> when HUGETLB_PAGE is not available irrespective of the select statement on
>> the platforms ?
> 
> depends doesn't properly work for variables that are selected.
> 

Alright, will move the HUGETLB_PAGE dependency to platforms while selecting
the variable HUGETLB_PAGE_SIZE_VARIABLE.
