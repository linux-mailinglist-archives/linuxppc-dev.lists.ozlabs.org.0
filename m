Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC8240A71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:42:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQKw20CbRzDqTy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 01:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sym2.noone.org
 (client-ip=2a01:4f8:120:4161::3; helo=sym2.noone.org;
 envelope-from=tklauser@sym2.noone.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=distanz.ch
Received: from sym2.noone.org (sym2.noone.org [IPv6:2a01:4f8:120:4161::3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQKpJ2p24zDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 01:37:11 +1000 (AEST)
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BQKp25YMkzvjcX; Mon, 10 Aug 2020 17:36:57 +0200 (CEST)
Date: Mon, 10 Aug 2020 17:36:56 +0200
From: Tobias Klauser <tklauser@distanz.ch>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] Documentation/features: refresh powerpc arch support files
Message-ID: <20200810153653.ggho3mnxltdhrlxm@distanz.ch>
References: <20200810100906.3805-1-tklauser@distanz.ch>
 <4b6b65e8-ec79-ebf0-0ab5-7b48182584f1@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b6b65e8-ec79-ebf0-0ab5-7b48182584f1@csgroup.eu>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-08-10 at 17:09:51 +0200, Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> 
> Le 10/08/2020 � 12:09, Tobias Klauser a �crit�:
> > Support for these was added by commit aa65ff6b18e0 ("powerpc/64s:
> > Implement queued spinlocks and rwlocks").
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >   Documentation/features/locking/queued-rwlocks/arch-support.txt  | 2 +-
> >   .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
> > index 5c6bcfcf8e1f..4dd5e554873f 100644
> > --- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
> > +++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
> > @@ -22,7 +22,7 @@
> >       |       nios2: | TODO |
> >       |    openrisc: |  ok  |
> >       |      parisc: | TODO |
> > -    |     powerpc: | TODO |
> > +    |     powerpc: |  ok  |
> 
> In your commit log you are refering to a commit titled "powerpc/64s:"
> 
> Are you sure it is now OK for all powerpc, not only for book3s/64 as
> suggested by yout text ?

The change was generated by running
Documentation/features/scripts/features-refresh.sh
Sorry, I should have mentioned this in the commit message. I noticed the
updated features for powerpc after updating the RISC-V supported
features [1].

[1] https://lore.kernel.org/linux-riscv/20200810095000.32092-1-tklauser@distanz.ch/T/#u

AFAIK, the features-refresh.sh script has no way of distinguishing
between different types of an architecture. It just checks for the
respective Kconfig symbols listed in the
Documentation/features/**/arch-support.txt files in all arch/**/Kconfig
files and updates the feature to "ok" if it finds the Kconfig symbol.
