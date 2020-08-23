Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C81F724EA88
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 02:13:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BYwh13sPKzDqB4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Aug 2020 10:13:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BYwfR1s5vzDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Aug 2020 10:11:40 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 07N0B38x017004;
 Sat, 22 Aug 2020 19:11:03 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 07N0B1Iw017003;
 Sat, 22 Aug 2020 19:11:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 22 Aug 2020 19:11:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Guohua Zhong <zhongguohua1@huawei.com>
Subject: Re: =?utf-8?B?UmXvvJpSZQ==?=
 =?utf-8?Q?=3A?= [PATCH] powerpc: Fix a bug in __div64_32 if divisor is zero
Message-ID: <20200823001101.GO28786@gate.crashing.org>
References: <8dedfcce-04e0-ec7d-6af5-ec1d6d8602b0@csgroup.eu>
 <20200822165433.58228-1-zhongguohua1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822165433.58228-1-zhongguohua1@huawei.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: wangle6@huawei.com, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, paulus@samba.org, nixiaoming@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 23, 2020 at 12:54:33AM +0800, Guohua Zhong wrote:
> Yet, I have noticed that there is no checking of 'base' in these functions.
> But I am not sure how to check is better.As we know that the result is 
> undefined when divisor is zero. It maybe good to print error and dump stack.
>  Let the process to know that the divisor is zero by sending SIGFPE. 

That is now what the PowerPC integer divide insns do: they just leave
the result undefined (and they can set the overflow flag then, but no
one uses that).


Segher
