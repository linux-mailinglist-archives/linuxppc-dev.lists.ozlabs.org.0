Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F81647FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 16:13:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N1Sl5tlZzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 02:13:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::331;
 helo=mail-ot1-x331.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I0uJUohb; dkim-atps=neutral
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N1Qm6Y8dzDqT1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 02:11:42 +1100 (AEDT)
Received: by mail-ot1-x331.google.com with SMTP id h9so412425otj.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 07:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ztnuCSYTaaHjXeHBmYlvymRTRYgVQIwAyJ8lQvmRF6w=;
 b=I0uJUohb9fj/iaXYLvvdhgYfipgRPLhx1W4p/k4ior+oP7iWOSiO63bjgxBkwbhmnO
 I8kioC7mqcuzGXe7y8lQutWV2XegHdB4r+rlhwGXQLlkEtoAsj/3pgqwaDvcGPvPcBpr
 m9oIxH+H0dXUaFMYPz9h8fmX8f+J+mZ2H25+/LNsiJsFOZxl69gBdhkqG22sVsjTYPWq
 5QcJ2CLkDyN+ru8RQUJ4Gw4HNvoVIv93R5JMRJIBE+UWOfKcv5TrjA+dfSvi87gBMxHC
 dwR40B/a4T+HOJpZXjt5sT0vBkyt47ZVHfyv77DzTzWfhGzAMZWz8Hp70KDLcdqTCkuP
 oiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ztnuCSYTaaHjXeHBmYlvymRTRYgVQIwAyJ8lQvmRF6w=;
 b=osaCI4rFSrV8p/lnWRSkwoogoY062zeVf1r38wCQvFbQxvLAvWS/8qZzjbo12kUqcW
 sIv3Y46cnUSaJP6khkIXxJYgbkXR+TuKgbHCTrsZeYagFrgj655WJ2Aib8isMnHjEDVh
 zQsylHLjuc8DCGLfpqi9Kkca4gBwIPkeoCAVTVvrM/FlnsbwsT5S1RFvm4zKXfF1Lbnw
 pjYo62NW8O7AcqEbKhZW6xY9/yheLdabVHINAHo/i7wCHgS8kg0kLVP3R5wv6kFrDeJv
 yA2LaoTArLKi3FMv5fZQ05ZEOlJ0mPhXmleIwIrJT5Gg3YLNsqgoD/7OHAsomiHp7a/z
 akHg==
X-Gm-Message-State: APjAAAX5wNgRkgEKxeTn1WMPyPDImLGjNUrMoXcFjpz0Nqs5VgXtKjwM
 yH5Rlu2paadZnNqm0bXVOHeCnU2YAumGOSWSKcg=
X-Google-Smtp-Source: APXvYqysnnRVKILD2kLZVSBYCYIDrKHYLtyUXzKP0ZgDb8qes5fQ1tCepb20TmmVtEqVPbmvTzU2xSrU7Xc0afqoINA=
X-Received: by 2002:a05:6830:1049:: with SMTP id
 b9mr20924860otp.100.1582125099051; 
 Wed, 19 Feb 2020 07:11:39 -0800 (PST)
MIME-Version: 1.0
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
In-Reply-To: <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
From: Radu Rendec <radu.rendec@gmail.com>
Date: Wed, 19 Feb 2020 10:11:27 -0500
Message-ID: <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
Subject: Re: MCE handler gets NIP wrong on MPC8378
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/18/2020 at 1:08 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> Le 18/02/2020 =C3=A0 18:07, Radu Rendec a =C3=A9crit :
> > The saved NIP seems to be broken inside machine_check_exception() on
> > MPC8378, running Linux 4.9.191. The value is 0x900 most of the times,
> > but I have seen other weird values.
> >
> > I've been able to track down the entry code to head_32.S (vector 0x200)=
,
> > but I'm not sure where/how the NIP value (where the exception occurred)
> > is captured.
>
> NIP value is supposed to come from SRR0, loaded in r12 in PROLOG_2 and
> saved into _NIP(r11) in transfer_to_handler in entry_32.S

Thank you so much for the information, it is extremely helpful!

> Can something clobber r12 at some point ?
>
> Maybe add the following at some place to trap when it happens ?
>
> tweqi r12, 0x900
>
> If you put it just after reading SRR0, and just before writing into
> NIP(r11), you'll see if its wrong from the begining or if it is
> overwriten later.

I did something even simpler: I added the following

        lis r12,0x1234

... right after

        mfspr r12,SPRN_SRR0

... and now the NIP value I see in the crash dump is 0x12340000. This
means r12 is not clobbered and most likely the NIP value I normally see
is the actual SRR0 value.

Just to be sure that SRR0 is not clobbered before it's even saved to r12
(very unlikely though) I changed the code to save SRR0 to r8 at the very
beginning of the handler (first instruction, at address 0x200) and then
load r12 from r8 later. This of course clobbers r8, but it's good for
testing. Now in the crash dump I see 0x900 in both NIP and r8.

So I think I ruled out any problem in the Linux MCE handler. MPC8378 has
an e300 core and I double checked with the e300 core reference manual
(e300coreRM.pdf from NXP). I couldn't find anything weird there either.
Quoting from the RM:

| 5.5.2.1 Machine Check Interrupt Enabled (MSR[ME] =3D 1)
|
| When a machine check interrupt is taken, registers are updated as
| shown in Table 5-14.
|
| Table 5-14. Machine Check Interrupt=E2=80=94Register Settings
|
| SRR0 Set to the address of the next instruction that would have been
|      completed in the interrupted instruction stream. Neither this
|      instruction nor any others beyond it will have been completed.
|      All preceding instructions will have been completed.

At this point I'm assuming a silicon bug, although I couldn't find
anything interesting in the Errata provided by NXP.

Best regards,
Radu
