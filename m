Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E968B42778C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 07:36:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HRDM75dkWz3c8R
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 16:36:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=james.clark@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HQkn43X2Dz2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Oct 2021 21:23:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27AECD6E;
 Fri,  8 Oct 2021 03:23:46 -0700 (PDT)
Received: from [10.57.25.67] (unknown [10.57.25.67])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BA103F70D;
 Fri,  8 Oct 2021 03:23:44 -0700 (PDT)
Subject: Re: [PATCH] perf vendor events power10: Add metric events json file
 for power10 platform
To: Kajol Jain <kjain@linux.ibm.com>
References: <20211006073119.276340-1-kjain@linux.ibm.com>
From: James Clark <james.clark@arm.com>
Message-ID: <4cd80a52-3938-a708-9272-99e9ed86be00@arm.com>
Date: Fri, 8 Oct 2021 11:23:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211006073119.276340-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 09 Oct 2021 16:36:15 +1100
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, jolsa@redhat.com,
 linux-kernel@vger.kernel.org, "acme@kernel.org" <acme@kernel.org>,
 linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/10/2021 08:31, Kajol Jain wrote:
> Add pmu metric json file for power10 platform.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../arch/powerpc/power10/metrics.json         | 772 ++++++++++++++++++

I checked this with the new strict JSON parser from "[PATCH 0/3] perf tools: Enable strict JSON parsing"
and it seemed fine from that point of view.

James
