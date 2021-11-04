Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5FD4450D5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 10:02:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlHhP2jX1z3bNB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 20:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlHgy698Hz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 20:01:49 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4HlHgs5zzgz1qwdy;
 Thu,  4 Nov 2021 10:01:45 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4HlHgs5Ww7z1qqkd;
 Thu,  4 Nov 2021 10:01:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id jpwjYGu3dAku; Thu,  4 Nov 2021 10:01:45 +0100 (CET)
X-Auth-Info: hyN1qwWjSmTAlG7ZQTf0EJhBUN/TZW9TZLOoU0wDUmhOxAyRZRTFUt080OYgCtSS
Received: from igel.home (ppp-46-244-165-151.dynamic.mnet-online.de
 [46.244.165.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  4 Nov 2021 10:01:45 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 79AC22C17B5; Thu,  4 Nov 2021 10:01:44 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Stanley Johnson <stanley.johnson.001@protonmail.com>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb__21333.0969143257$1635819996$gmane$org@nippy.intranet>
 <87cznh39lk.fsf@igel.home>
 <3723058-87f1-cba7-c8ad-ac8dc5722abe@linux-m68k.org>
 <m0OyfpLa146ICa5BY-R6updiBgoAJmoZY4ywxwIMXAXKPzX6HQrpXInpO7V28XnYOm87T4pTbY4VTmJxeY2c_L4u7s4D84cvxQ3Ab-D86_M=@protonmail.com>
X-Yow: I just got my PRINCE bumper sticker..
 But now I can't remember WHO he is...
Date: Thu, 04 Nov 2021 10:01:44 +0100
In-Reply-To: <m0OyfpLa146ICa5BY-R6updiBgoAJmoZY4ywxwIMXAXKPzX6HQrpXInpO7V28XnYOm87T4pTbY4VTmJxeY2c_L4u7s4D84cvxQ3Ab-D86_M=@protonmail.com>
 (Stanley Johnson's message of "Thu, 04 Nov 2021 02:00:22 +0000")
Message-ID: <87fsscjnuv.fsf@igel.home>
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
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Riccardo Mottola <riccardo.mottola@libero.it>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I don't use debian.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
