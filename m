Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA4871392
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:21:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OdKfLlsw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfTD3VCTz30gM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:21:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OdKfLlsw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfSX2S8Yz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:21:16 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dca160163dso49997385ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709605273; x=1710210073; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMZOdoq6Dmbi4LnQtjTEVix7bF7RPhz5sddKIgU5EMs=;
        b=OdKfLlswhFXa5LKv5ba9iQR23DNtGJmow92pZ+fRo0JtscoAuNVSwYwnnb+p0cw45n
         j+DVmUIH/uQguEdTUpIVCJHz5ymQM7+0SpRw5I9UD77i5PMqGJybLORgDlV2uapuDLLA
         EzbobOCGA8Z4Udn7nC97aQulsx1fTZsuJ9mrrxtjjHGEYIs26GAhzdRPluZaAdMh2zMI
         MAeBP+oucZnY54qeU5IOVeiVXqe4PByFUpaes1qhMRUApMv+xPq7McpgAITbrKLL2env
         0H8mclI7Hk6QNfbZX/SMYoUvyqCIpKUXBvwslmFwcVTsplpr4R1rTJe8MmDWNpEmhVzv
         zGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709605273; x=1710210073;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMZOdoq6Dmbi4LnQtjTEVix7bF7RPhz5sddKIgU5EMs=;
        b=Mw3l6LDwQsEgHIGobOoTN0K+3jLn9KFPDe5n1j3yh5TUDz5+9m4jf4dSjhuEDBHRhm
         x5sZLYDYWt3gHXZW2P4Pnd1H+ATCfEfiCu1Ztxf+q/HX/JS5BWpAzPQ2KItD7O6caSX9
         Tuhkrn8eDqVSwPxAanWgL7XSyOfscnrqfL12mePOBxWCn5pvKGbyGLRSoIl+S6Gm6Iyq
         cBVBtxvF75Tge4ll6utnKcSzv6QyuNhUGhz1WIYkzmWll38GiMoKmNCedYgY0hdrQzHP
         Z1PD2aCxj94OIbL9pdXrIxkLK1AI0dcgUhdiRNlz7CnQl2PQtgKK0kL8YU60VmOgQIrz
         9nog==
X-Forwarded-Encrypted: i=1; AJvYcCUhTHJ++5+u7x/EfqnMLzCrbJD01VAQTs879fHd4T3Wa0lmIhkdq3LUzi4jTzb6hCmISf0rjDl3WJo4JCcA6V364yS015zrQ9K8DhJD5g==
X-Gm-Message-State: AOJu0YzA7qNI5mlgFSYQYtB+4nYutrkqqEKU6atWHi8O1eRC5ZWbA35x
	Mkt8mxDiNGg3JW5bwFjuOFf3wER3vdmmy+JHDjip19jh3y29bdbv
X-Google-Smtp-Source: AGHT+IHPKg+tkuJXSJcg4KkR+/5CA+1vAdrQ3XJqdc9bBtp6fXYAPq+C0dmymDHfd39CB8cmSSfPyg==
X-Received: by 2002:a17:902:ecc4:b0:1dd:8f6:69ee with SMTP id a4-20020a170902ecc400b001dd08f669eemr726916plh.20.1709605273623;
        Mon, 04 Mar 2024 18:21:13 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090264c900b001dcdfbad420sm8628918pli.149.2024.03.04.18.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:21:13 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:21:05 +1000
Message-Id: <CZLGHKHQ3FF0.2H7R39AIIFDY@wheely>
Subject: Re: [kvm-unit-tests PATCH 1/7] arch-run: Keep infifo open
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-2-npiggin@gmail.com>
 <e802a3a4-5ab7-447f-b09b-75d710ba7bd6@redhat.com>
In-Reply-To: <e802a3a4-5ab7-447f-b09b-75d710ba7bd6@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 1, 2024 at 11:32 PM AEST, Thomas Huth wrote:
> On 26/02/2024 10.38, Nicholas Piggin wrote:
> > The infifo fifo that is used to send characters to QEMU console is
> > only able to receive one character before the cat process exits.
> > Supporting interactions between test and harness involving multiple
> > characters requires the fifo to remain open.
> >=20
> > This also allows us to let the cat out of the bag, simplifying the
> > input pipeline.
>
> LOL, we rather let the cat out of the subshell now, but I like the play o=
n=20
> words :-)

It was a bit of a stretch, but I'm glad you liked it :) I may
incorporate your suggestion to improve it.

>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   scripts/arch-run.bash | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index 6daef3218..e5b36a07b 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -158,6 +158,11 @@ run_migration ()
> >   	mkfifo ${src_outfifo}
> >   	mkfifo ${dst_outfifo}
> >  =20
> > +	# Holding both ends of the input fifo open prevents opens from
> > +	# blocking and readers getting EOF when a writer closes it.
> > +	mkfifo ${dst_infifo}
> > +	exec {dst_infifo_fd}<>${dst_infifo}
> > +
> >   	eval "$migcmdline" \
> >   		-chardev socket,id=3Dmon,path=3D${src_qmp},server=3Don,wait=3Doff \
> >   		-mon chardev=3Dmon,mode=3Dcontrol > ${src_outfifo} &
> > @@ -191,14 +196,10 @@ run_migration ()
> >  =20
> >   do_migration ()
> >   {
> > -	# We have to use cat to open the named FIFO, because named FIFO's,
> > -	# unlike pipes, will block on open() until the other end is also
> > -	# opened, and that totally breaks QEMU...
> > -	mkfifo ${dst_infifo}
> >   	eval "$migcmdline" \
> >   		-chardev socket,id=3Dmon,path=3D${dst_qmp},server=3Don,wait=3Doff \
> >   		-mon chardev=3Dmon,mode=3Dcontrol -incoming unix:${dst_incoming} \
> > -		< <(cat ${dst_infifo}) > ${dst_outfifo} &
> > +		< ${dst_infifo} > ${dst_outfifo} &
> >   	incoming_pid=3D$!
> >   	cat ${dst_outfifo} | tee ${dst_out} | filter_quiet_msgs &
> >  =20
> > @@ -245,7 +246,6 @@ do_migration ()
> >  =20
> >   	# keypress to dst so getchar completes and test continues
> >   	echo > ${dst_infifo}
> > -	rm ${dst_infifo}
>
> I assume it will not get deleted by the trap handler? ... sounds fine to =
me,=20
> so I dare to say:

Yep, deleted by trap handler.

>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks,
Nick
