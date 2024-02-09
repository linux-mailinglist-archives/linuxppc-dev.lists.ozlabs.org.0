Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414D84F178
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 09:40:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=moyrFQ9G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWS3D0vvtz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 19:40:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=moyrFQ9G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWS2V0Knlz3bvX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 19:39:28 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3bfd40ff56fso252145b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 00:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707467965; x=1708072765; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyKQn9uFT2a/J5rDvpN0cP8mjeStBcBZBirfXqZnRa0=;
        b=moyrFQ9GA8nTtAgBU2iVQurfW0OMVVpREL0mvAb6MujiJoDEu0I3cSWocjglNt4Mjs
         03e0dBJ0Sjb+6EdnEMDOCQVmOe59FWq/QtBlBacqV4EutAjwLvOQ9qaRXQWiLoHicrqL
         GygEhqYY5jwdPuBnMcZ2qzSZQ03C3mmKk/QxvnW3H1aYrMUad+wnNwAxUaRbZZv4sXlu
         8w2U3yAZvQQbgvACwfB0L9tLw3wK1eJf6Xfs4joDOLExvdMhTKqyYe4ZwIm4PtU61d8i
         wWU90Fmq1yK1JlYtvc94MNp8ktLVxDoOH6/2BwztcfomKgDOkEisGhdVCms2W9YFD5NB
         03Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707467965; x=1708072765;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nyKQn9uFT2a/J5rDvpN0cP8mjeStBcBZBirfXqZnRa0=;
        b=i7puzQL2nF32qMM8a/OW3LmmluC4zZ1/GySyjplUuRKIie5xtrBdymxH7yQH2fSZ2m
         /TdSirxLXqe7PnY5Uebn7ldio9Qee84UmKudDOPoVEPQpkRq2ZoSEHwC22byzWxBOtNG
         Ri0ik+StMYPA1e1Wl1i/0kcCr20tKZ18LQCo1Odx1LW0bW3dNSerqYaK7A46W1vD1cwY
         A4LxL8+eJqkRONF30SpCZrTbBepaG0zy+yx0xzu2vf8aZMGhFCKLqCuofBqIBQZghwfE
         iXU4qUS9SaLe/N7RlaXpgcQpYkn+EFfs5qPbo7Vfh8bjNSQNjXwxyaPS5IpKHsSTtE4i
         6wmw==
X-Forwarded-Encrypted: i=1; AJvYcCVPtxgOUghlsMRCUnTMCleub3Z5aR37TJzap+53EXA4FVV4phk5W16ta+uP8cxrMBAuTFz6Twy02cfV4bmd6jk/KqkMbrZEIXiymiAcwA==
X-Gm-Message-State: AOJu0YwbMFw3ZFOmRUCr7l8V60FZ931U6Zw/zIXjvoE+S3GbA/qoFhDb
	4/Li3Gk5HqIWx2p0mKKXY/W5vj5VIDc5sLf6FPQmkzM+9Ubg/HCb
X-Google-Smtp-Source: AGHT+IGCD7fGlpE/kOjkFgbPUXzNVL+89RLw5kmiWdG3Q5ZSYTmewWMqAE+Sy77LLy05iz4j3BcBew==
X-Received: by 2002:a05:6808:5d1:b0:3bf:f3d2:df11 with SMTP id d17-20020a05680805d100b003bff3d2df11mr951728oij.33.1707467965199;
        Fri, 09 Feb 2024 00:39:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBbBYWPx9ICb3NUFgr2PZmgRNPwfiBtNOzx3mqOeSzznXalqLN2RcMQJ99wKy4+RJz7BLpOxBMjyiU+zDFIP/sckpJK32WMRJUivhTUecrE+4+BXmlotghzLmqs+UeZdEwi3mWsP3RIiaL+zSp3ATw/m6LVZIbcEOySMT5Wlq7lu0yjCf4u9bEsiDelGVecH+34/BBbqVP5iUCvtPj/2z3MA5GY7lA0K/ndNh/LxnW9330y9gvwxHvtmU+KAMHOOpjHPhb6mVfBPmNgEjUAkUh2jNNnWIQzuHAR9hLY4ZHtVHYLo/tYVJ8jzb96xEt1fTjAwcJM6Xgu4rbinNzuV5AwAgsj8j2qnz05RizpXraGHPfeIGMYli1YViSiK/cw9ezOT15X2vhHPdLMgIrlIy/EsPL3YTPbZZA5QiM17bJRnpSUhD4PBDWeq21Bv+VZEdoPdbi6ZKpa6FsthxwDyNGUCv88EYoz21JCkC0j2f/bJPREMoMfJtyQ2czE1AUS+/msmAQNLFIzYpttIB8/dDLqVqi
Received: from localhost ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id y65-20020a62ce44000000b006e0945e03easm299516pfg.143.2024.02.09.00.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 00:39:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 18:39:15 +1000
Message-Id: <CZ0EVI7IZ9YY.3EF4ZKA9IXM5I@wheely>
Subject: Re: [kvm-unit-tests PATCH v3 4/8] migration: Support multiple
 migrations
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240209070141.421569-1-npiggin@gmail.com>
 <20240209070141.421569-5-npiggin@gmail.com>
 <74f469c3-76ee-4589-b3ec-17a8b7428950@redhat.com>
In-Reply-To: <74f469c3-76ee-4589-b3ec-17a8b7428950@redhat.com>
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
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 9, 2024 at 6:19 PM AEST, Thomas Huth wrote:
> On 09/02/2024 08.01, Nicholas Piggin wrote:
> > Support multiple migrations by flipping dest file/socket variables to
> > source after the migration is complete, ready to start again. A new
> > destination is created if the test outputs the migrate line again.
> > Test cases may now switch to calling migrate() one or more times.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> ...
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index 3689d7c2..a914ba17 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -129,12 +129,16 @@ run_migration ()
> >   		return 77
> >   	fi
> >  =20
> > +	migcmdline=3D$@
> > +
> >   	trap 'trap - TERM ; kill 0 ; exit 2' INT TERM
> > -	trap 'rm -f ${migout1} ${migout_fifo1} ${migsock} ${qmp1} ${qmp2} ${f=
ifo}' RETURN EXIT
> > +	trap 'rm -f ${migout1} ${migout2} ${migout_fifo1} ${migout_fifo2} ${m=
igsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
> >  =20
> >   	migsock=3D$(mktemp -u -t mig-helper-socket.XXXXXXXXXX)
> >   	migout1=3D$(mktemp -t mig-helper-stdout1.XXXXXXXXXX)
> >   	migout_fifo1=3D$(mktemp -u -t mig-helper-fifo-stdout1.XXXXXXXXXX)
> > +	migout2=3D$(mktemp -t mig-helper-stdout2.XXXXXXXXXX)
> > +	migout_fifo2=3D$(mktemp -u -t mig-helper-fifo-stdout2.XXXXXXXXXX)
> >   	qmp1=3D$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
> >   	qmp2=3D$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
> >   	fifo=3D$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
> > @@ -142,18 +146,61 @@ run_migration ()
> >   	qmpout2=3D/dev/null
> >  =20
> >   	mkfifo ${migout_fifo1}
> > -	eval "$@" -chardev socket,id=3Dmon1,path=3D${qmp1},server=3Don,wait=
=3Doff \
> > +	mkfifo ${migout_fifo2}
> > +
> > +	eval "$migcmdline" \
> > +		-chardev socket,id=3Dmon1,path=3D${qmp1},server=3Don,wait=3Doff \
> >   		-mon chardev=3Dmon1,mode=3Dcontrol > ${migout_fifo1} &
> >   	live_pid=3D$!
> >   	cat ${migout_fifo1} | tee ${migout1} &
> >  =20
> > -	# We have to use cat to open the named FIFO, because named FIFO's, un=
like
> > -	# pipes, will block on open() until the other end is also opened, and=
 that
> > -	# totally breaks QEMU...
> > +	# The test must prompt the user to migrate, so wait for the "migrate"
> > +	# keyword
> > +	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
> > +		if ! ps -p ${live_pid} > /dev/null ; then
> > +			echo "ERROR: Test exit before migration point." >&2
> > +			qmp ${qmp1} '"quit"'> ${qmpout1} 2>/dev/null
> > +			return 3
> > +		fi
> > +		sleep 0.1
> > +	done
> > +
> > +	# This starts the first source QEMU in advance of the test reaching t=
he
> > +	# migration point, since we expect at least one migration. Subsequent
> > +	# sources are started as the test hits migrate keywords.
> > +	do_migration || return $?
> > +
> > +	while ps -p ${live_pid} > /dev/null ; do
> > +		# Wait for EXIT or further migrations
> > +		if ! grep -q -i "Now migrate the VM" < ${migout1} ; then
> > +			sleep 0.1
> > +		else
> > +			do_migration || return $?
> > +		fi
> > +	done
> > +
> > +	wait ${live_pid}
> > +	ret=3D$?
> > +
> > +	while (( $(jobs -r | wc -l) > 0 )); do
> > +		sleep 0.1
> > +	done
> > +
> > +	return $ret
> > +}
> > +
> > +do_migration ()
> > +{
> > +	# We have to use cat to open the named FIFO, because named FIFO's,
> > +	# unlike pipes, will block on open() until the other end is also
> > +	# opened, and that totally breaks QEMU...
> >   	mkfifo ${fifo}
> > -	eval "$@" -chardev socket,id=3Dmon2,path=3D${qmp2},server=3Don,wait=
=3Doff \
> > -		-mon chardev=3Dmon2,mode=3Dcontrol -incoming unix:${migsock} < <(cat=
 ${fifo}) &
> > +	eval "$migcmdline" \
> > +		-chardev socket,id=3Dmon2,path=3D${qmp2},server=3Don,wait=3Doff \
> > +		-mon chardev=3Dmon2,mode=3Dcontrol -incoming unix:${migsock} \
> > +		< <(cat ${fifo}) > ${migout_fifo2} &
> >   	incoming_pid=3D$!
> > +	cat ${migout_fifo2} | tee ${migout2} &
> >  =20
> >   	# The test must prompt the user to migrate, so wait for the "migrate=
" keyword
> >   	while ! grep -q -i "Now migrate the VM" < ${migout1} ; do
>
> So the old check for the "migrate" keyword is also still around?

It's just the comment is staleish, it only checks "Now migrate...".

> Why do we=20
> need to wait on two spots for the "Now mirgrate..." string now?

So that the it ensures we do one migration, subsequent ones are
optional.

I was thinking we could just remove that, and possibly even
remove the MIGRATION=3Dyes/no paths and always just use the same
code here. But that's for another time.

Actually there is some weirdness here. There are *three* spots
where it waits for migration. The first one in run_migration
can be removed, because it can call do_migration right away
to start up the destination qemu process ahead of the first
migration message as-per comment. I'll respin with that change.

Thanks,
Nick
