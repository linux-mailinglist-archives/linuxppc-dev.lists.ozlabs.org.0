Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A929CCB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 00:34:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLSjV5227zDqRX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 10:34:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 417 seconds by postgrey-1.36 at bilbo;
 Wed, 28 Oct 2020 10:33:24 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLSgm6t5YzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 10:33:23 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CLSWZ43TGz1qrf4;
 Wed, 28 Oct 2020 00:26:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CLSWZ2sGWz1qxh0;
 Wed, 28 Oct 2020 00:26:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5rzp0rheSnFs; Wed, 28 Oct 2020 00:26:17 +0100 (CET)
X-Auth-Info: RS9aI4PlyTCBHGWJrSWEDVriYnK+Ge5YcPCqkwJrXrVC6IGL/CAq2pX641Nc5O6k
Received: from igel.home (ppp-46-244-161-64.dynamic.mnet-online.de
 [46.244.161.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 28 Oct 2020 00:26:17 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id E56742C2B09; Wed, 28 Oct 2020 00:26:16 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/uaccess: Switch __put_user_size_allowed()
 to __put_user_asm_goto()
References: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy__44535.5968013004$1599217383$gmane$org@csgroup.eu>
X-Yow: Here we are in America...  when do we collect unemployment?
Date: Wed, 28 Oct 2020 00:26:16 +0100
In-Reply-To: <94ba5a5138f99522e1562dbcdb38d31aa790dc89.1599216721.git.christophe.leroy__44535.5968013004$1599217383$gmane$org@csgroup.eu>
 (Christophe Leroy's message of "Fri, 4 Sep 2020 11:01:30 +0000 (UTC)")
Message-ID: <87mu079ron.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sep 04 2020, Christophe Leroy wrote:

> __put_user_asm_goto() provides more flexibility to GCC and avoids using
> a local variable to tell if the write succeeded or not.
> GCC can then avoid implementing a cmp in the fast path.

That breaks CLONE_CHILD_SETTID.  I'm getting an assertion failure in
__libc_fork (THREAD_GETMEM (self, tid) != ppid).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
