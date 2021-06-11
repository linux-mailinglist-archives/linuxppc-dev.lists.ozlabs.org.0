Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0433A49A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 21:55:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1s5C4K4Lz3c77
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 05:55:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=sudeep.holla@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4G1s4q4yssz307W
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 05:54:48 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6312D1FB;
 Fri, 11 Jun 2021 12:54:44 -0700 (PDT)
Received: from bogus (unknown [10.57.73.170])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 576DC3F719;
 Fri, 11 Jun 2021 12:54:43 -0700 (PDT)
Date: Fri, 11 Jun 2021 20:54:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/64: drop redundant defination of
 spin_until_cond
Message-ID: <20210611195422.uwtm5px5lr5pkljb@bogus>
References: <1fff2054e5dfc00329804dbd3f2a91667c9a8aff.1623438544.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1fff2054e5dfc00329804dbd3f2a91667c9a8aff.1623438544.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 11, 2021 at 07:10:57PM +0000, Christophe Leroy wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
> 
> linux/processor.h has exactly same defination for spin_until_cond.
> Drop the redundant defination in asm/processor.h
>

Wow you must be real good at ML archaeology, this must have been at-least
3+ years old. I found this when I wanted to you spin_until_cond. Thanks
anyways for digging the original patch, nobody would have remembered even
if you posted fresh 😉.

-- 
Regards,
Sudeep
