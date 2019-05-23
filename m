Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3328CE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 00:25:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4593wJ0G0YzDqZn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 08:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.117; helo=emh07.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh07.mail.saunalahti.fi (emh07.mail.saunalahti.fi
 [62.142.5.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4593ty5yB2zDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 08:23:51 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-4-80-nat.elisa-mobile.fi
 [85.76.4.80])
 by emh07.mail.saunalahti.fi (Postfix) with ESMTP id AE053B0062;
 Fri, 24 May 2019 01:23:44 +0300 (EEST)
Date: Fri, 24 May 2019 01:23:44 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [BISECTED] kexec regression on PowerBook G4
Message-ID: <20190523222344.GC5234@darkstar.musicnaut.iki.fi>
References: <20190521221859.GC3621@darkstar.musicnaut.iki.fi>
 <90f3557b-400b-60b5-9ff8-d5605adeee79@c-s.fr>
 <a8f8a0d7-1737-4c83-4587-8d4dc87c3ecb@c-s.fr>
 <20190522201310.GB456@darkstar.musicnaut.iki.fi>
 <20190522223335.Horde.JIF8kbX8AwL8wErArEvEcg1@messagerie.si.c-s.fr>
 <20190522211724.GC456@darkstar.musicnaut.iki.fi>
 <a3619327-14ba-ff34-913f-cf3384284c9a@c-s.fr>
 <20190523172717.GA5234@darkstar.musicnaut.iki.fi>
 <dc24cfa0-cefa-3245-a9aa-5493b094ffac@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc24cfa0-cefa-3245-a9aa-5493b094ffac@c-s.fr>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, May 23, 2019 at 08:58:11PM +0200, Christophe Leroy wrote:
> Le 23/05/2019 à 19:27, Aaro Koskinen a écrit :
> >On Thu, May 23, 2019 at 07:33:38AM +0200, Christophe Leroy wrote:
> >>Ok, the Oops confirms that the error is due to executing the kexec control
> >>code which is located outside the kernel text area.
> >>
> >>My yesterday's proposed change doesn't work because on book3S/32, NX
> >>protection is based on setting segments to NX, and using IBATs for kernel
> >>text.
> >>
> >>Can you try the patch I sent out a few minutes ago ?
> >>(https://patchwork.ozlabs.org/patch/1103827/)
> >
> >It now crashes with "BUG: Unable to handle kernel instruction fetch"
> >and the faulting address is 0xef13a000.
> 
> Ok.
> 
> Can you try with both changes at the same time, ie the mtsrin(...) and the
> change_page_attr() ?
> 
> I suspect that allthough the HW is not able to check EXEC flag, the SW will
> check it before loading the hash entry.

Unfortunately still no luck... The crash is pretty much the same with both
changes.

A.
