Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E78F284EFB9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 06:02:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d0DJjGTi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWMDS6K8zz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 16:02:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=d0DJjGTi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWMCl3KSDz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 16:02:09 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-296a02b7104so426494a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 21:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707454927; x=1708059727; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wqz7Y/TcTN7smUZ/N4fhNV46jTItRF0U++Hxc5pAtk=;
        b=d0DJjGTipdqCJ/1oNudCzqlq/NQjtHiYua1H7RzvB7leOoRqj5DPlYK86VeU5KRU+j
         vYTBgY7/m+i9bbb9uAnAVPZ4Utl1igImpK/RReuM/D3L+XUk+uNJD9r/O4nwlN+6pmYG
         w+NPAJy3U1Xu4ejNNHOU2cxC0uYWScE2FClyrh8geb/9PldhXjrecUltZfbetqvGMkkb
         s+ptagHzSiJn94BvrhUXrLx6vOkcladHBAOh+6APTJ0pLqdAqQubaNDSqXHRsk01SWww
         0sQZwzQtSY+VTBq70aFDF89USLXoNuRVTA/xnELCXKiriJYHm6b9Exnkyk9ekXjf9/AD
         diCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707454927; x=1708059727;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0wqz7Y/TcTN7smUZ/N4fhNV46jTItRF0U++Hxc5pAtk=;
        b=JlpBghw8w6GauVYwYA0cyu0D7FZbHOovObbylw5dI1ylKxbuDp+OAXYhFt3XSE6YlR
         yYCmuyh3nq4VtJGJCJivrWjzPW0a7WCGc9nCEsdrXYagLbIjD7AfAVOpUsVjKqMRzruT
         hw9UTg5tApIuGR0PyazG/hh9NHMs+vBfGmwsD+AtSGhcgyZL0SbiCrFMkk1Hq9+4cQOH
         ydvDlbhPbdEynSoRn1v8Er5tc3v0uIvCVg/58AzU/1h8s5R25DPi1U++GhOyyhNNuj//
         cefbmiaWpMdgc9y5kbfKfjCEl1gBb0YcOdPWlao0X1BPIr/Qo0ekK8LgNjvQJicbdejT
         Fufw==
X-Gm-Message-State: AOJu0Yx8HXJM8CuiIHLp2beDAtS8OhxHcNi1adzTvNtVBnCm2QrFllVq
	UGUDpu2PTjSAXp7WJMPnyxTPI97LCPrOgT+ln9GJIxEM5vPf4HXJ
X-Google-Smtp-Source: AGHT+IEKRg+nU8BWUu6QYFnkof43Ezzita86bZjmYmWTU2CUj7lvOVVnWbVZiYrOWORfbM//Bd/KAg==
X-Received: by 2002:a17:90a:bf02:b0:296:fe8d:248b with SMTP id c2-20020a17090abf0200b00296fe8d248bmr460936pjs.4.1707454926617;
        Thu, 08 Feb 2024 21:02:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1gF5gyLodB9BkGeJgen+1IIQ898R25d9CxVUmwkcouUztyRgoFsqK6P/mdgxB8x2pFV63YnmUNoLXFz2tkj7tHB7BvZmMZtYCvmDYODZMgL6nAqi89JPL5OaMfN5wM7G+P/WEybND0q6L4npV2znOQTSXmjEfIM3vzWJGupZpCgApmK4Zp8537Kqb71pvvVCTG4IRXg/Ead8zsQkmaEGQf9EjyTNySMaIRyfi1UrqBNkWWzvE9Mhh27Hmr9u1j4fsYKdHqpt4KVsAm1byPRjBNTsC8PB9+4mz3BIeaSJVBX7hsxQcI5cAI85egsiwkEykDe++XJtbcn2LYw+BzjhlXrdMumIdXRIoqGb97NvoBlhgTavF03Nb47HVUU08eovz6ZBIHWxmMFKsWAYJXTsTuAivdoz+c7ew7L3p2ykLTjmmfwbQzEcokGzQvK9bHlV2pddrFIOsFhaMzkqe//FxH4GakiPArNdISfUQb6O4BNCeNdQ=
Received: from localhost ([1.146.65.44])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090301c500b001d7610fdb7csm608163plh.226.2024.02.08.21.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 21:02:06 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 15:01:56 +1000
Message-Id: <CZ0A93T119VP.1LQ0MR1O0PYJE@wheely>
Subject: Re: [kvm-unit-tests PATCH v2 2/9] arch-run: Clean up temporary
 files properly
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-3-npiggin@gmail.com>
 <c9039fc4-9809-43d9-8a99-88da1446d67f@redhat.com>
In-Reply-To: <c9039fc4-9809-43d9-8a99-88da1446d67f@redhat.com>
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
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Feb 7, 2024 at 5:58 PM AEST, Thomas Huth wrote:
> On 02/02/2024 07.57, Nicholas Piggin wrote:
> > Migration files weren't being removed when tests were interrupted.
> > This improves the situation.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   scripts/arch-run.bash | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index d0864360..f22ead6f 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -134,12 +134,14 @@ run_migration ()
> >   	qmp1=3D$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
> >   	qmp2=3D$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
> >   	fifo=3D$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
> > +
> > +	# race here between file creation and trap
> > +	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
> > +	trap "rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}" RETURN EXI=
T
> > +
> >   	qmpout1=3D/dev/null
> >   	qmpout2=3D/dev/null
> >  =20
> > -	trap 'kill 0; exit 2' INT TERM
> > -	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXI=
T
> > -
> >   	eval "$@" -chardev socket,id=3Dmon1,path=3D${qmp1},server=3Don,wait=
=3Doff \
> >   		-mon chardev=3Dmon1,mode=3Dcontrol | tee ${migout1} &
> >   	live_pid=3D`jobs -l %+ | grep "eval" | awk '{print$2}'`
> > @@ -211,8 +213,8 @@ run_panic ()
> >  =20
> >   	qmp=3D$(mktemp -u -t panic-qmp.XXXXXXXXXX)
> >  =20
> > -	trap 'kill 0; exit 2' INT TERM
> > -	trap 'rm -f ${qmp}' RETURN EXIT
> > +	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
> > +	trap "rm -f ${qmp}" RETURN EXIT
> >  =20
> >   	# start VM stopped so we don't miss any events
> >   	eval "$@" -chardev socket,id=3Dmon1,path=3D${qmp},server=3Don,wait=
=3Doff \
>
> So the point is that the "EXIT" trap wasn't executed without the "trap -=
=20
> TERM" in the other trap? ... ok, then your patch certainly makes sense.

Iff you don't remove the TERM handler then the kill will recursively
invoke it until some crash. This did solve some cases of dangling temp
files for me, although now I test with a simple script:

  #!/bin/bash

  trap 'echo "INT" ; kill 0 ; exit 2' INT
  trap 'trap - TERM ; echo "TERM" ; kill 0 ; exit 2' TERM
  trap 'echo "RETURN"' RETURN
  trap 'echo "EXIT"' EXIT

  sleep 10
  echo "done"

If you ^C it then it still doesn't get to the EXIT or RETURN handlers.
It looks like 'kill -INT $$' might be the way to do it instad of kill 0.

Not sure if that means my observation was incorrect, or if the real
script is behaving differently. In any case, I will dig into it and
try to explain more precisely in the changelog what it is fixing. And
possibly do another patch for the 'kill -INT $$' if that is needed.

Thanks,
Nick
