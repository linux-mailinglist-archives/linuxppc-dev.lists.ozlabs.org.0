Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C81DF36861F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 19:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FR4Rb5cCWz30Dr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 03:39:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Smc5xpn1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Smc5xpn1; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FR4R82MXNz2xZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 03:38:57 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id
 q123-20020a1c43810000b029012c7d852459so4566771wma.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 10:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2vkXac7yp9NUvqcf8IeQfovS3NNdlTrsnVHyXJyBs9E=;
 b=Smc5xpn1IYP2qUdFPFDJ96mWkjUYNho7weEWvckpTAfNRmv9BDQUeyznUT+axkyEBf
 S44iFvbr13GwraiI4x/ZAainLJ4LUlQ/L4SFBDKpAyTJ4XHa1FMfHmH5/eW9Cz3SCkCP
 Iy8a5yC79kDBlA1PTpOafMX1z9SBHzdsDMSWZllpLdeLvHt+NaQSBmQHFXTpEkXK4cjw
 i15S3c/EM2AwEpjoHB6sRN0/+z2mVBwV3cH9OtKQNnCAa11UlKVE7rVbxSkIJI6Ct4vR
 5acuOFckbeuwFDhmNsWYHIlCgGtQNoJ3VPdxsKuCwHFhd3dltPErzNo6zGDO2CVWiT1P
 A9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2vkXac7yp9NUvqcf8IeQfovS3NNdlTrsnVHyXJyBs9E=;
 b=m4cU8/KpU6ssmRQNst5p3drOEbj+6Ss/1QdlO1fing1YtjUajZAlBu6F1TaGLOBsYQ
 P0Lq5IFUvdT9K32WUiJBhn7bwDvkIH+WwaIKPqEBUT/Hqp2B96RXRbT1UU4bq1NPvZaP
 tPFp+OOthcP/HXAPfsszJi4Q0TaVhHYPFCyWsRvDsZagA+oPVtUV7sDCfHqClQ627Vuq
 e4JJr90mFt29JMntzP35vJAnPb4P5gHf4cL9RII0TTGY+5pqU1sikEaMIqdLKRK6mvNx
 YIBLTl+N6iv9G4snP/wGpmnLbb+6UihUNXVSseOn9ECfGM7ggXI0b+1Us7PujsDgeqqs
 vU+A==
X-Gm-Message-State: AOAM5316ThdiPwW58Bv11Z+/LxqguZWOLo1NNARDbgmEvWzFCfH/80Lr
 X/fYNKb+NTRXpAw5dDBs6LgROVM+RWmSIpS1HyE=
X-Google-Smtp-Source: ABdhPJyoKLeikWw8HkfoV3BagAb55y2ug3Z8C5su2wr4ffVdez5eCKuw5rmXCehRVEju8ZmiQUqEnRPqY9TXd2UkdnE=
X-Received: by 2002:a05:600c:9:: with SMTP id g9mr5124786wmc.134.1619113133872; 
 Thu, 22 Apr 2021 10:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
 <20210421064527.GA2648262@us.ibm.com>
 <CAOhMmr4ckVFTZtSeHFHNgGPUA12xYO8WcUoakx7WdwQfSKBJhA@mail.gmail.com>
 <20210422172135.GY6564@kitsune.suse.cz>
In-Reply-To: <20210422172135.GY6564@kitsune.suse.cz>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 22 Apr 2021 12:38:43 -0500
Message-ID: <CAOhMmr5=4rhhrGJBvB8-HL-bjo-9RGi1u-jP43GSvDcc=BgF7A@mail.gmail.com>
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: netdev@vger.kernel.org, Lijun Pan <ljp@linux.vnet.ibm.com>,
 Tom Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 12:21 PM Michal Such=C3=A1nek <msuchanek@suse.de> w=
rote:
>
> Hello,
>
> On Thu, Apr 22, 2021 at 12:06:45AM -0500, Lijun Pan wrote:
> > On Wed, Apr 21, 2021 at 2:25 AM Sukadev Bhattiprolu
> > <sukadev@linux.ibm.com> wrote:
> > >
> > > Lijun Pan [ljp@linux.vnet.ibm.com] wrote:
> > > >
> > > >
> > > > > On Apr 20, 2021, at 4:35 PM, Dany Madden <drt@linux.ibm.com> wrot=
e:
> > > > >
> > > > > When ibmvnic gets a FATAL error message from the vnicserver, it m=
arks
> > > > > the Command Respond Queue (CRQ) inactive and resets the adapter. =
If this
> > > > > FATAL reset fails and a transmission timeout reset follows, the C=
RQ is
> > > > > still inactive, ibmvnic's attempt to set link down will also fail=
. If
> > > > > ibmvnic abandons the reset because of this failed set link down a=
nd this
> > > > > is the last reset in the workqueue, then this adapter will be lef=
t in an
> > > > > inoperable state.
> > > > >
> > > > > Instead, make the driver ignore this link down failure and contin=
ue to
> > > > > free and re-register CRQ so that the adapter has an opportunity t=
o
> > > > > recover.
> > > >
> > > > This v2 does not adddress the concerns mentioned in v1.
> > > > And I think it is better to exit with error from do_reset, and sche=
dule a thorough
> > > > do_hard_reset if the the adapter is already in unstable state.
> > >
> > > We had a FATAL error and when handling it, we failed to send a
> > > link-down message to the VIOS. So what we need to try next is to
> > > reset the connection with the VIOS. For this we must talk to the
> > > firmware using the H_FREE_CRQ and H_REG_CRQ hcalls. do_reset()
> > > does just that in ibmvnic_reset_crq().
> > >
> > > Now, sure we can attempt a "thorough hard reset" which also does
> > > the same hcalls to reestablish the connection. Is there any
> > > other magic in do_hard_reset()? But in addition, it also frees lot
> > > more Linux kernel buffers and reallocates them for instance.
> >
> > Working around everything in do_reset will make the code very difficult
> > to manage. Ultimately do_reset can do anything I am afraid, and do_hard=
_reset
> > can be removed completely or merged into do_reset.

Michal,

I should have given more details about the above statement. Thanks for
your detailed info in the below.

>
> This debate is not very constructive.
>
> In the context of driver that has separate do_reset and do_hard_reset
> this fix picks the correct one unless you can refute the arguments
> provided.
>
> Merging do_reset and do_hard_reset might be a good code cleanup which is
> out of the scope of this fix.

Right.

>
>
>
> Given that vast majority of fixes to the vnic driver are related to the
> reset handling it would improve stability and testability if every
> reset took the same code path.

I agree.

>
> In the context of merging do_hard_reset and do_reset the question is
> what is the intended distinction and performance gain by having
> 'lightweight' reset.

Right.

>
> I don't have a vnic protocol manual at hand and I suspect I would not
> get one even if I searched for one.
>
> From reading through the fixes in the past my understanding is that the
> full reset is required when the backend changes which then potentially
> requires different size/number of buffers.

Yes, full reset is better when the backend changes.

>
> What is the expected situation when reset is required without changing
> the backend?
>
> Is this so common that it warrants a separate 'lightweight' optimized
> function?
>
