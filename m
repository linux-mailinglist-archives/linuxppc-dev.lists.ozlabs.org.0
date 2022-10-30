Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90A612C8B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 21:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0nNt0KF1z3cWl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 07:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0nNK06Dyz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 07:06:07 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4N0nN36cMnz1s94G;
	Sun, 30 Oct 2022 21:05:55 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4N0nN33b4Tz1qqlR;
	Sun, 30 Oct 2022 21:05:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id u0-L5-uxttF2; Sun, 30 Oct 2022 21:05:54 +0100 (CET)
X-Auth-Info: h9k9pZCO5KSlJYd3rGzbfz7+lJvAu3OZG8hRT+iYPePjrAOR8gBFlTR7emHpi9c8
Received: from igel.home (aftr-82-135-86-167.dynamic.mnet-online.de [82.135.86.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 30 Oct 2022 21:05:54 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 928BD2C358A; Sun, 30 Oct 2022 21:05:54 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH v6 21/25] powerpc: Provide syscall wrapper
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
	<20220921065605.1051927-22-rmclure@linux.ibm.com>
	<87h6zlgwb1.fsf@igel.home>
	<8d567e4a-6972-458d-b220-eec56ba52ed9@app.fastmail.com>
X-Yow: Somewhere in suburban Honolulu, an unemployed bellhop is whipping up
 a batch of illegal psilocybin chop suey!!
Date: Sun, 30 Oct 2022 21:05:54 +0100
In-Reply-To: <8d567e4a-6972-458d-b220-eec56ba52ed9@app.fastmail.com> (Arnd
	Bergmann's message of "Sun, 30 Oct 2022 20:43:38 +0100")
Message-ID: <87y1sxf55p.fsf@igel.home>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Okt 30 2022, Arnd Bergmann wrote:

> On Sun, Oct 30, 2022, at 16:34, Andreas Schwab wrote:
>> This breaks powerpc32.  The fallocate syscall misinterprets its
>> arguments.
>
> It was fixed in

Nope.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
