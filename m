Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2548C3C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 13:09:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYmZK66Chz3bbv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 23:09:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYmYq4yMkz2xsG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 23:08:45 +1100 (AEDT)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MrhDg-1mbd8v2MlA-00nhAd for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan
 2022 13:08:41 +0100
Received: by mail-wr1-f49.google.com with SMTP id h10so3871941wrb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 04:08:40 -0800 (PST)
X-Gm-Message-State: AOAM532dFRapCMoCJx7aRfTVv61ab26eCNbVQOdYb4AdUTEE4a9qyWEq
 ApqEzPY6OT5HMscaCdatg75HG/zRfUvGuMJZhD4=
X-Google-Smtp-Source: ABdhPJyNUKzidEWwkYa+wfOUEohIKCR5feZK5S3WXkq+SYeCBRFZTq1mqc61Ubm+2cYuonDIFIyFwZ5WRZ3fGi7ACRI=
X-Received: by 2002:adf:fd46:: with SMTP id h6mr7767440wrs.192.1641989320742; 
 Wed, 12 Jan 2022 04:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20220111083515.502308-1-hch@lst.de>
 <20220111083515.502308-5-hch@lst.de>
 <CAK8P3a0mHC5=OOGV=sGnC9JqZWxzsJyZbTefnCtryQU3o3PY_g@mail.gmail.com>
 <20220112075609.GA4854@lst.de>
 <CAK8P3a1ONn=FiPU3669MjBMntS-1K5bgX4pHforUsYJ7yhwZ-g@mail.gmail.com>
 <f86483fca8b0dc68ce243ba47998ff3296a3b6f8.camel@kernel.org>
In-Reply-To: <f86483fca8b0dc68ce243ba47998ff3296a3b6f8.camel@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 12 Jan 2022 13:08:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FgHQ+w+Sj00yOERRLWfVhx7NYsGJ1NBAXQ0=is3G=Kg@mail.gmail.com>
Message-ID: <CAK8P3a3FgHQ+w+Sj00yOERRLWfVhx7NYsGJ1NBAXQ0=is3G=Kg@mail.gmail.com>
Subject: Re: [PATCH 4/5] uapi: always define F_GETLK64/F_SETLK64/F_SETLKW64 in
 fcntl.h
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IP4v/PU0GUQmEBzFR34Nn696PyDeZ9BhaTPNbE7A3pojQkVXe/m
 ZEp+GdH5sCDhCM6otRoyPErg2chJrhxB7o1O6X8HDWtiPcpjnNL4uCVgFCCFVBzVEvKuheo
 FKxy45rSF9nb1sB0ZxG3zCtLY6maP0AKSovEa0MoZts9C/wSrMlO+4SYAiZOXLEudYNiezz
 DWeNGAp0vF589mHKezFYQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r7ZzGcufUeM=:dyfX/vNeyTrI5fksKegGMy
 l6/9W6Bu9yjnjqKihmqfUDjODYpve7MZiypRRHJ8znd/giHdKXHAM/NlCbEMBZBJywOpYbP7n
 DD0BlBuqwXnnUbGmgEWOZSi1+SJtHV+JUJh544L0i8xgEaNpEXnsBnHUq/WDsAdqCRRutbZiS
 Q5/5UgqXW6BtY9KuSJSycgjqSXDXIBq7T4SqJqDnj5lR3wkCt++xC87mT9YB60GpuP0lgj5f8
 +xxTqvAclciHC84SRzUa5r21yrDJoqK6m8pD4OfDON8Eud2GZSZQJdJrh0ffOiUdULlJ+Vq36
 jxa9Bo9Unm+y+Q4k9SaPKTLHTRLmISU9eAnUWpkrWionC5qiwrTEYXUIqeglcVo9AkQKq0KQF
 95ewLki9tNSVNQkNYf6eFG6rhVXppewfhT1TlmAoOLIvlvFftPq/ngxcHBR42CkwoAB7w1TYw
 bsJ4KBty0Svf6JVIlgLLfjG0345/AUInnC0E1m174UIu+mLeed7qa6AA0B62Y8KKy13fSFE17
 jcC2MN8DWZdYRklxK99wctDuXsWNwWv+Tqry4jajNZheudhY1htQu6aT4xQUjbw1opUsdhv1E
 ISfLAKCE/InIJWA899n3Gcbg8OXtryoYZ34Jo+KlD9ck1Vn659DAtgqUXcN5ytmPp8YjYLjrV
 gA4ge83xkcWRTm0lbu0j8l2HchfPzeiSMIFcvgcyi1phz8QZWDpV6n1MtmOFI3PJxFkU=
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 "J. Bruce Fields" <bfields@fieldses.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 12, 2022 at 12:15 PM Jeff Layton <jlayton@kernel.org> wrote:
> On Wed, 2022-01-12 at 09:28 +0100, Arnd Bergmann wrote:
> > On Wed, Jan 12, 2022 at 8:56 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Exactly, that is the tradeoff, which is why I'd like the flock maintainers
> > to say which way they prefer. We can either do it more correctly (hiding
> > the constants from user space when they are not usable), or with less
> > change (removing the incorrect #ifdef). Either way sounds reasonable
> > to me, I mainly care that this is explained in the changelog and that the
> > maintainers are aware of the two options.
> >
>
> I don't have a strong opinion here. If we were taking symbols away that
> were previously visible to userland it would be one thing, but since
> we're just adding symbols that may not have been there before, this
> seems less likely to break anything.

Changing

#ifndef CONFIG_64BIT

to

#if __BITS_PER_LONG==32 || defined(__KERNEL__),

would take symbols away, since the CONFIG_64BIT macro is never
set in user space.

> I probably lean toward Christoph's original solution instead of keeping
> the conditional definitions. It's hard to imagine there are many
> programs that care whether these other symbols are defined or not.
>
> You can add this to the original patch:
>
> Acked-by: Jeff Layton <jlayton@kernel.org>

Sounds good, thanks

         Arnd
