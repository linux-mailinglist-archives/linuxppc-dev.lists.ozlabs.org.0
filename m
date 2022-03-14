Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551F34D8FFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 00:01:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHX8H14wlz3bVy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:01:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TUKp05b5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHX7c1ft0z2xY3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:00:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TUKp05b5; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KHX7c1PLrz4xLQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 10:00:28 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KHX7c16QYz4xv5; Tue, 15 Mar 2022 10:00:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30;
 helo=mail-yb1-xb30.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TUKp05b5; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KHX7b68psz4xLQ
 for <linuxppc-dev@ozlabs.org>; Tue, 15 Mar 2022 10:00:27 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id e186so33839893ybc.7
 for <linuxppc-dev@ozlabs.org>; Mon, 14 Mar 2022 16:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=X+nvWH6D/CvHgUstLqn2JNtFFj9VcwNmgq2LynrfPNE=;
 b=TUKp05b5Uo32B0j6uUlMR923aQtLuqw9ub6T0AMtya6ZUfBWpPm6NLWDAEp81BvcwR
 eBso+WfLQWayawcQifTfafTnvElGME0Ai0+DewyyW+OB5jeAX2l5AVke3d0r8E+MhlNu
 iFN66D1O1VpptwK8Bdm7hULgiKomjmRX7LyHfAYSkp0WFH+WEDdynayvymfdIUovZA71
 VA5jfpud/VaEl9mSVrP/MR7lVinzL9oxibOd0fl7353q+DHXe8bqVkBs6eKFLmIRFgiz
 fHZ0XRPUGgOwT30K0+I5HYnr/nEtJsOv6P0Bm0a1DlNCELSWBIgze3+un6RGPoogmEPY
 452A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=X+nvWH6D/CvHgUstLqn2JNtFFj9VcwNmgq2LynrfPNE=;
 b=JplZuBzjWKCf4kDnzsWJgxqpLq53wuYBAa3WwjK1uV/iSKs/4OPiSeQ0PmmC2DEk5o
 38uXfeFgtUxBHvXPDSeETTRGV5ELv+A2QpmeEbVq8v50FyGMdtplF39y4ojHSoQygZqs
 4XkV4p0g6Rmqd1xJrgbQ7ICXKNZGeGt0cXJ5sAklT9VeU7cKXnNXF6dwF/Yjnn6gian3
 uKgrtMgNc14DA3+kosq89DWmmN9rniZQTaVkB5f8zc0nFU5lhMJi9bPWWIqUrg0TkXUW
 gze44Ed1emrIKsZU6tIXjhg08c/AlsLfQ9w8KGlO1zJqRDkfWlEx2GYxa2oHIqN5NG57
 y1Pg==
X-Gm-Message-State: AOAM530vGX1sABzuOsixnnKdawDYaC24HudRVFJ2bXrs4a4bczoDjNNt
 HOwJm2/TdYSb9bvIYEJa2DkXd3Nbqc4qK5atquY=
X-Google-Smtp-Source: ABdhPJzsRX8YvDwzONL2hRnkywDr8XZ+VInbSzDa5p37sySH6J6u/ZJbpEQNOJvgrSPWhSdpDdbxPk5mo2ys3ciFZvs=
X-Received: by 2002:a25:cd84:0:b0:628:9d43:8a3c with SMTP id
 d126-20020a25cd84000000b006289d438a3cmr19488431ybf.491.1647298823518; Mon, 14
 Mar 2022 16:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200602052728.18227-1-jniethe5@gmail.com>
 <20200602052728.18227-3-jniethe5@gmail.com>
 <4029503f-dbc4-cb68-5f40-771e8d0bfbc6@csgroup.eu>
In-Reply-To: <4029503f-dbc4-cb68-5f40-771e8d0bfbc6@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 15 Mar 2022 10:00:11 +1100
Message-ID: <CACzsE9pcLTTjtYCNYcEaTmfpr-gbnF3hMQB5nDKYC2eyeE6pZQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] powerpc: Handle prefixed instructions in
 show_user_instructions()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@ozlabs.org, Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 1:34 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 02/06/2020 =C3=A0 07:27, Jordan Niethe a =C3=A9crit :
> > Currently prefixed instructions are treated as two word instructions by
> > show_user_instructions(), treat them as a single instruction. '<' and
> > '>' are placed around the instruction at the NIP, and for prefixed
> > instructions this is placed around the prefix only. Make the '<' and '>=
'
> > wrap the prefix and suffix.
> >
> > Currently showing a prefixed instruction looks like:
> > fbe1fff8 39200000 06000000 a3e30000 <04000000> f7e40000 ebe1fff8 4e8000=
20
> >
> > Make it look like:
> > 0xfbe1fff8 0x39200000 0x06000000 0xa3e30000 <0x04000000 0xf7e40000> 0xe=
be1fff8 0x4e800020 0x00000000 0x00000000
>
> Is it really needed to have the leading 0x ?
You are right, that is not consistent with how instructions are usually dum=
ped.
That formatting comes from ppc_inst_as_str(), which when mpe merged he
removed the leading 0x.

>
> And is there a reason for that two 0x00000000 at the end of the new line
> that we don't have at the end of the old line ?
No, that is wrong.
>
> This is initially split into 8 instructions per line in order to fit in
> a 80 columns screen/terminal.
>
> Could you make it such that it still fits within 80 cols ?
Sure that makes sense.
>
> Same for patch 4 on show_user_instructions()
>
> Christophe
