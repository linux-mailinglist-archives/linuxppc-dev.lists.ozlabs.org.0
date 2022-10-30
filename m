Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 413A5612B55
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 16:50:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0gjX0WYHz3cQ0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 02:50:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0ghz2VW6z2yHL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 02:50:10 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4N0ghv67HFz1s7tr;
	Sun, 30 Oct 2022 16:50:07 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4N0ghv5bbcz1qqlR;
	Sun, 30 Oct 2022 16:50:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id vxwExyZ1-5ku; Sun, 30 Oct 2022 16:50:07 +0100 (CET)
X-Auth-Info: 5zeDXCNQ/UEhCeHClO7h3SHtH8ep0+2E+NV1JsWTIrMOpG+Ycz8SGBupkQMlM0WA
Received: from igel.home (aftr-82-135-86-167.dynamic.mnet-online.de [82.135.86.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 30 Oct 2022 16:50:07 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id E90932C358A; Sun, 30 Oct 2022 16:50:06 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH v6 21/25] powerpc: Provide syscall wrapper
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
	<20220921065605.1051927-22-rmclure@linux.ibm.com>
	<87h6zlgwb1.fsf@igel.home>
X-Yow: They collapsed....  like nuns in the street...
 they had no teen appeal!
Date: Sun, 30 Oct 2022 16:50:06 +0100
In-Reply-To: <87h6zlgwb1.fsf@igel.home> (Andreas Schwab's message of "Sun, 30
	Oct 2022 16:34:10 +0100")
Message-ID: <87cza9gvkh.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It probably breaks every syscall with a 64-bit argument.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
