Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A9D371468
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 13:38:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYgw03m3bz301q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 21:38:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYgvc6lq7z2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 21:38:03 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4FYgvW0JCcz1qt44;
 Mon,  3 May 2021 13:37:59 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4FYgvW01jTz1qqkX;
 Mon,  3 May 2021 13:37:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fUNk04eY5dAH; Mon,  3 May 2021 13:37:58 +0200 (CEST)
X-Auth-Info: 3VtxtlqOt/dnxm12XJb/mPGQPUoRs961j2rNeQeDngF0Dh6bAEdArIBJRnN8z9k5
Received: from igel.home (ppp-46-244-165-131.dynamic.mnet-online.de
 [46.244.165.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon,  3 May 2021 13:37:58 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id C7FDC2C31B6; Mon,  3 May 2021 13:37:57 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/64: Option to use ELFv2 ABI for big-endian
 kernels
References: <20210503110713.751840-1-npiggin__45037.8389026568$1620040079$gmane$org@gmail.com>
X-Yow: Look into my eyes and try to forget that you have a Macy's charge card!
Date: Mon, 03 May 2021 13:37:57 +0200
In-Reply-To: <20210503110713.751840-1-npiggin__45037.8389026568$1620040079$gmane$org@gmail.com>
 (Nicholas Piggin's message of "Mon, 3 May 2021 21:07:13 +1000")
Message-ID: <87eeeooxnu.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
Cc: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Should this add a tag to the module vermagic?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
