Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A44298F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 15:31:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459S2Y6yL4zDqVb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 23:31:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=iki.fi
 (client-ip=62.142.5.107; helo=emh01.mail.saunalahti.fi;
 envelope-from=aaro.koskinen@iki.fi; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=iki.fi
Received: from emh01.mail.saunalahti.fi (emh01.mail.saunalahti.fi
 [62.142.5.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459Rzc71LTzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 23:29:13 +1000 (AEST)
Received: from darkstar.musicnaut.iki.fi (85-76-86-221-nat.elisa-mobile.fi
 [85.76.86.221])
 by emh01.mail.saunalahti.fi (Postfix) with ESMTP id 07F4A20080;
 Fri, 24 May 2019 16:29:08 +0300 (EEST)
Date: Fri, 24 May 2019 16:29:07 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [BISECTED] kexec regression on PowerBook G4
Message-ID: <20190524132907.GE5234@darkstar.musicnaut.iki.fi>
References: <20190522223335.Horde.JIF8kbX8AwL8wErArEvEcg1@messagerie.si.c-s.fr>
 <20190522211724.GC456@darkstar.musicnaut.iki.fi>
 <a3619327-14ba-ff34-913f-cf3384284c9a@c-s.fr>
 <20190523172717.GA5234@darkstar.musicnaut.iki.fi>
 <dc24cfa0-cefa-3245-a9aa-5493b094ffac@c-s.fr>
 <20190523222344.GC5234@darkstar.musicnaut.iki.fi>
 <334b0aca-3731-5754-bd26-af147991345d@c-s.fr>
 <ed5f9739-7661-b32a-cb8f-157b516baafa@c-s.fr>
 <20190524073615.GD5234@darkstar.musicnaut.iki.fi>
 <969271d1-0943-42e6-8992-77b20e305e48@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <969271d1-0943-42e6-8992-77b20e305e48@c-s.fr>
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

On Fri, May 24, 2019 at 09:40:30AM +0200, Christophe Leroy wrote:
> Le 24/05/2019 à 09:36, Aaro Koskinen a écrit :
> >On Fri, May 24, 2019 at 08:08:36AM +0200, Christophe Leroy wrote:
> >>>Le 24/05/2019 à 00:23, Aaro Koskinen a écrit :
> >>>>Unfortunately still no luck... The crash is pretty much the same with
> >>>>both
> >>>>changes.
> >>>
> >>>Right. In fact change_page_attr() does nothing because this part of RAM is
> >>>mapped by DBATs so v_block_mapped() returns not NULL.
> >>>
> >>>So, we have to set an IBAT for this area. I'll try and send you a new
> >>>patch for that before noon (CET).
> >>>
> >>
> >>patch sent out. In the patch I have also added a printk to print the buffer
> >>address, so if the problem still occurs, we'll know if the problem is really
> >>at the address of the buffer or if we are wrong from the beginning.
> >
> >Reboot code buffer at ef0c3000
> >Bye!
> >BUG: Unable to handle kernel instruction fetch
> >Faulting instruction address: 0xef0c3000
> >
> 
> Oops, I forgot to call update_bats() after setibat().
> 
> Can you add it and retry ?

Thanks, that was it, now it finally works!

A.
