Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 298BB376116
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 09:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fc2621MkYz2ymQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 17:25:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JhxJBXe7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JhxJBXe7; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fc25W2Sczz2yXZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 May 2021 17:24:46 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so4277457wmi.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 May 2021 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K42tngszNSdkaHIJaExOS3M8P/GdvDfzingPlFrUO8M=;
 b=JhxJBXe7c46BVXHMdifT13YizrYqt7E/iTew+fYZJxlQec/CQ5T5gz/zzpZf8kNyMX
 /ufjLdbMPtYbShxA0IMTKayOFKl/rOkAWEYHB/QOd3IZB67EMe26Ewn927d3wpZR0mfP
 dYPmRPkD6eHyB7uJYgBzOMfSbx6zBaFWTQl2PJaXdGBGBkKSX7umfsyDzRwhCG9kh00f
 6H2rPUdgDxkX35rrZZLVsnGRzRqs8/l6ws7lnhT1JtK/+DB3/T/Ko1+XEuLT/z1C9GQn
 UPy/gXjyrV8yLf+AB7AQ6v+n13SwoA9FTVYmmIxM6gWI3fte1GbG3otRG6PvJ3oxup73
 m4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K42tngszNSdkaHIJaExOS3M8P/GdvDfzingPlFrUO8M=;
 b=M35Ow/yfTt2ZvA2hAzGqUTrgY2SHVEFlT50UyiM7KLRf/mCIUTNL9E1cesHpmoAogE
 ehjUKozPTsztCVY2MSQXPH0deCK+Fe+bJ1ObkwXge/2BTJ7RCLCOfna9BdnrqJVBtUsm
 /RY7GDkKPYexlWKTBAQDbm5YVcgIg3bF52HMwR01CFar875lzUaXp7z/rdnHhPkahVYs
 l+1FiSSOcswFQB4WUPtDuz0SiFJXC0Cao1CAVj6btUzQieNJLkfEKrnm2okZsv60VCy5
 tb821dEVi4pFOdOOnoaR64kZd0oXJpB3sgYc0BVr7ErqtKck7zs0iirF6Y+Vm+2+jMZg
 hsnQ==
X-Gm-Message-State: AOAM533O8qOvH0BIsFPCm7CUgRywM//p/MzQJMbmlyfq3vmDZV9D8XST
 2fNc8DaRQ8JhdCbN8NqQpi7PWigrEJXfMBN2YBU=
X-Google-Smtp-Source: ABdhPJxgj3g+lVjMSuTxpErj8fIA9nSaCWRKVuHWeO+sh4LXI9mFDhcsLJc9TKcSP/zT7zoEOrf+cHayuXXcOd+UGHA=
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr19183472wmq.159.1620372279560; 
 Fri, 07 May 2021 00:24:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210504191142.2872696-1-drt@linux.ibm.com>
 <CAOhMmr5T_BLkqGspnzck=xtiX0rPABv8oX4=LCRbH00T8-B6qw@mail.gmail.com>
 <CAOhMmr5ucF3pa4jp9RLEzJNs29oVT0qAXmywNnd+Xe2seoRJfg@mail.gmail.com>
 <54060bf8c570a52eaa74a034b6096c99@imap.linux.ibm.com>
In-Reply-To: <54060bf8c570a52eaa74a034b6096c99@imap.linux.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Fri, 7 May 2021 02:24:28 -0500
Message-ID: <CAOhMmr5vwZv6Dv2pegx8Uvq_iTvhRLoHbigdiADBaE7L2Gtf2A@mail.gmail.com>
Subject: Re: [PATCH net v3] ibmvnic: Continue with reset if set link down
 failed
To: Dany Madden <drt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 3:24 PM Dany Madden <drt@linux.ibm.com> wrote:
>
> On 2021-05-04 12:31, Lijun Pan wrote:
> > On Tue, May 4, 2021 at 2:27 PM Lijun Pan <lijunp213@gmail.com> wrote:
> >>
> >> On Tue, May 4, 2021 at 2:14 PM Dany Madden <drt@linux.ibm.com> wrote:
> >> >
> >> > When ibmvnic gets a FATAL error message from the vnicserver, it marks
> >> > the Command Respond Queue (CRQ) inactive and resets the adapter. If this
> >> > FATAL reset fails and a transmission timeout reset follows, the CRQ is
> >> > still inactive, ibmvnic's attempt to set link down will also fail. If
> >> > ibmvnic abandons the reset because of this failed set link down and this
> >> > is the last reset in the workqueue, then this adapter will be left in an
> >> > inoperable state.
> >> >
> >> > Instead, make the driver ignore this link down failure and continue to
> >> > free and re-register CRQ so that the adapter has an opportunity to
> >> > recover.
> >> >
> >> > Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
> >> > Signed-off-by: Dany Madden <drt@linux.ibm.com>
> >> > Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
> >> > Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> >> > ---
> >> > Changes in V2:
> >> > - Update description to clarify background for the patch
> >> > - Include Reviewed-by tags
> >> > Changes in V3:
> >> > - Add comment above the code change
> >> > ---
> >> >  drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++--
> >> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> >> > index 5788bb956d73..9e005a08d43b 100644
> >> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> >> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> >> > @@ -2017,8 +2017,15 @@ static int do_reset(struct ibmvnic_adapter *adapter,
> >> >                         rtnl_unlock();
> >> >                         rc = set_link_state(adapter, IBMVNIC_LOGICAL_LNK_DN);
> >> >                         rtnl_lock();
> >> > -                       if (rc)
> >> > -                               goto out;
> >> > +
> >> > +                       /* Attempted to set the link down. It could fail if the
> >> > +                        * vnicserver has already torn down the CRQ. We will
> >> > +                        * note it and continue with reset to reinit the CRQ.
> >> > +                        */
> >> > +                       if (rc) {
> >> > +                               netdev_dbg(netdev,
> >> > +                                          "Setting link down failed rc=%d. Continue anyway\n", rc);
> >> > +                       }
> >>
> >> There are other places which check and rely on the return value of
> >> this function. Your change makes that inconsistent. Can you stop
> >
> > To be more specific, __ibmvnic_close, __ibmvnic_open both call this
> > set_link_state.
> Inconsistent would have been not checking for the rc at all. Here we
> checked and noted it that there are times that it's ok to continue.
>
> >
> >> posting new versions and soliciting the maintainer to accept it before
> >> there is material change? There are many ways to make reset
> >> successful. I think this is the worst approach of all.
>
> Can you show me a patch that is better than this one, that has gone thru
> a 30+ hours of testing?

The patch review convention is: community review the patch, and the
patch author modifies the patch and resend. We are talking about the
patch itself, you came up with something about testing. You do not
take the reviewer's opinions but ask the reviewer to write a patch,
which is a little bit odd.
