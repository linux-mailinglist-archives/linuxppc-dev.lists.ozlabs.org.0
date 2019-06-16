Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E90647421
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 12:14:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RVZk6RsSzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jun 2019 20:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45RVY3279gzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jun 2019 20:13:25 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45RVXy03QRz1rGhP;
 Sun, 16 Jun 2019 12:13:22 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45RVXx6V0rz1qql1;
 Sun, 16 Jun 2019 12:13:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MOFsqklPMlpF; Sun, 16 Jun 2019 12:13:21 +0200 (CEST)
X-Auth-Info: cmuhtM6YUgJKHIsEcEpVlxTl8g7MpYPHC7rEiFby6sTT4CK1ale7h5rnC6HpCSiD
Received: from igel.home (ppp-46-244-189-62.dynamic.mnet-online.de
 [46.244.189.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 16 Jun 2019 12:13:21 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 748632C117A; Sun, 16 Jun 2019 12:13:20 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: christophe leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 13/16] powerpc/mm/32s: Use BATs for STRICT_KERNEL_RWX
References: <cover.1550775950.git.christophe.leroy@c-s.fr>
 <1e412310cc18ea654fb2ce4c935654d8d1069f27.1550775950.git.christophe.leroy@c-s.fr>
 <87blyz9jor.fsf@igel.home>
 <a76f7759-a407-3d9a-0f43-654fd7ea0b1e@c-s.fr>
X-Yow: Yow!
Date: Sun, 16 Jun 2019 12:13:20 +0200
In-Reply-To: <a76f7759-a407-3d9a-0f43-654fd7ea0b1e@c-s.fr> (christophe leroy's
 message of "Sun, 16 Jun 2019 10:20:29 +0200")
Message-ID: <87d0jdaldr.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
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
Cc: j.neuschaefer@gmx.net, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Jun 16 2019, christophe leroy <christophe.leroy@c-s.fr> wrote:

> If any of registers IBATs 4 to 7 are used, could you adjust
> CONFIG_ETEXT_SHIFT so that only IBATs 0 to 3 be used, and check if
> suspend/resume works when IBATs 4 to 7 are not used ?

I forgot to remove my patch.  With only 0-3 used, suspend/resume works.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
