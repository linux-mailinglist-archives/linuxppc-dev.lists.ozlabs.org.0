Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5041FF869
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 18:00:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nmqg02M8zDqT5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 02:00:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=NtRbu2cP; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nmm65Bb0zDqBN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 01:57:26 +1000 (AEST)
Received: from kicinski-fedora-PC1C0HJN (unknown [163.114.132.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A63120732;
 Thu, 18 Jun 2020 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592495843;
 bh=yOK9ZKCV3aiXNG3VrKpU+lumJHKMGUHzmP+zlrZ+sHI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NtRbu2cPtnbgaGOMa0dnWnL1RR3W8MiGitf3FvkvVz9kshmKUIS7Z50lDxYKU8F7F
 4DWhSkltMASyAZpN+SBwaoRuPPBojQH5mPjgZp7ryRjaceWh7pJd9AxpSOZEh6nS2F
 W2CDlpX6fT+FR0mb5bPNnU+yeQT8m1//fgLk/K3Y=
Date: Thu, 18 Jun 2020 08:57:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net] ibmveth: Fix max MTU limit
Message-ID: <20200618085722.110f3702@kicinski-fedora-PC1C0HJN>
In-Reply-To: <1592495026-27202-1-git-send-email-tlfalcon@linux.ibm.com>
References: <1592495026-27202-1-git-send-email-tlfalcon@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Jun 2020 10:43:46 -0500 Thomas Falcon wrote:
> The max MTU limit defined for ibmveth is not accounting for
> virtual ethernet buffer overhead, which is twenty-two additional
> bytes set aside for the ethernet header and eight additional bytes
> of an opaque handle reserved for use by the hypervisor. Update the
> max MTU to reflect this overhead.
> 
> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>

How about

Fixes: d894be57ca92 ("ethernet: use net core MTU range checking in more drivers")
Fixes: 110447f8269a ("ethernet: fix min/max MTU typos")

?
