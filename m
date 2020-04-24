Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE381B76C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 15:18:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497vql5zTtzDr8q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 23:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=19w6=6i=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497vn82x1SzDqMT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 23:15:56 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A2F8C2064C;
 Fri, 24 Apr 2020 13:15:53 +0000 (UTC)
Date: Fri, 24 Apr 2020 09:15:52 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/3] powerpc: Properly return error code from
 do_patch_instruction()
Message-ID: <20200424091552.497dc719@gandalf.local.home>
In-Reply-To: <16070946-1185-2aad-62fe-f4ed9cd4eefe@c-s.fr>
References: <cover.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <b1dbbb34a389a6f59eb6c99102d94c0070ddaf98.1587654213.git.naveen.n.rao@linux.vnet.ibm.com>
 <16070946-1185-2aad-62fe-f4ed9cd4eefe@c-s.fr>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 23 Apr 2020 18:21:14 +0200
Christophe Leroy <christophe.leroy@c-s.fr> wrote:

> Le 23/04/2020 =C3=A0 17:09, Naveen N. Rao a =C3=A9crit=C2=A0:
> > With STRICT_KERNEL_RWX, we are currently ignoring return value from
> > __patch_instruction() in do_patch_instruction(), resulting in the error
> > not being propagated back. Fix the same. =20
>=20
> Good patch.
>=20
> Be aware that there is ongoing work which tend to wanting to replace=20
> error reporting by BUG_ON() . See=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D166003

Thanks for the reference. I still believe that WARN_ON() should be used in
99% of the cases, including here. And only do a BUG_ON() when you know
there's no recovering from it.

In fact, there's still BUG_ON()s in my code that I need to convert to
WARN_ON() (it was written when BUG_ON() was still acceptable ;-)

-- Steve
