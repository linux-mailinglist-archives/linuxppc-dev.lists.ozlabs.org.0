Return-Path: <linuxppc-dev+bounces-10196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72C5B02612
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 23:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf40z5KJGz30W1;
	Sat, 12 Jul 2025 07:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752267763;
	cv=none; b=m+X2JhR9IRem8rSN/tt37Guc/qx53PY2dr4S8tlL5PCQLMQU0WY3BKb4sMpB2r9emXlKBLqpr/w5HEd4z1cZne/elNprpLu7843MMMq46UgjgzplCjUZmNC9h0HESeimPXuKBfx7XTwpQqt+b+Nxojf7cfoTW0+fAbzx5GWAwBl4CLV0OMn69yRLHvRAg6XviCwwzEde+7mWVtWIX1TgaTfJCxsXsl9uyUZr6ozGWbefDWoX7TLQFh12wQdPO6oQOVmOsYCdfy5RNKkEywRCVbdOINtKLrbnddxOP0rku41QIl3jpmzlTQlFzXdJSHhtptjlnU0Z0w2rdWDaLrvHvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752267763; c=relaxed/relaxed;
	bh=B8wqL7cjLc9wrp/M0s58Eu3w42p4LxpTNqj9aXGf6TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jrpnMDuFrCWEge3PLk5PaH/PYgLEmODaB6oZ2YOaenF1q5VqwUPilXDCrmNyFiu1LtvPujVjEh4kJ2ydNU+GZCTI5swFr2YwawJ8iw6J0+1oDZp2okRymlYIpKQjrobQ+iiHoT3pFPBtNJITGrZK8kKYl0rHAfjJlqxyLAiUC1FYMO2RmRADY3rJiWuZFh4gKn8PzQyxyr6YmuFCuV5yek9w5aosdWYBfY3ZjJmLXxP7x8B3h9wnnlOMxBL/Bt+oV7z2zYK9MpFJHYfg8ccLSRVL34Xluj9IPUNtgKrJ0EzSdkekHow7qURKwohgRfDAn7gVHaEpbNMfFBS/LreszA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KTVwqhWW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KTVwqhWW; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KTVwqhWW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KTVwqhWW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bf40y1vnDz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 07:02:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752267756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8wqL7cjLc9wrp/M0s58Eu3w42p4LxpTNqj9aXGf6TE=;
	b=KTVwqhWWsWNgC3BbtLRs+JNFgsxhYC+cRPydRGD/COTG4fWEknRmsoR+9NM1EROLWsRCfN
	5D/e+2zya5bM9oZjk+SveZaqnn7vHimL0OKnFDKzL6T5pQFKRbsHskctwHuiSC+E/kGlq6
	gJqzkiw/Sg//jU4ARFsKFr+HJHsfNKk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752267756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B8wqL7cjLc9wrp/M0s58Eu3w42p4LxpTNqj9aXGf6TE=;
	b=KTVwqhWWsWNgC3BbtLRs+JNFgsxhYC+cRPydRGD/COTG4fWEknRmsoR+9NM1EROLWsRCfN
	5D/e+2zya5bM9oZjk+SveZaqnn7vHimL0OKnFDKzL6T5pQFKRbsHskctwHuiSC+E/kGlq6
	gJqzkiw/Sg//jU4ARFsKFr+HJHsfNKk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-GrI8pxxKMY2WNM1p7xF6bQ-1; Fri, 11 Jul 2025 17:02:31 -0400
X-MC-Unique: GrI8pxxKMY2WNM1p7xF6bQ-1
X-Mimecast-MFC-AGG-ID: GrI8pxxKMY2WNM1p7xF6bQ_1752267750
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-607434dbc78so2539617a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 14:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752267750; x=1752872550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8wqL7cjLc9wrp/M0s58Eu3w42p4LxpTNqj9aXGf6TE=;
        b=ewPvBXkvbTLyI8NVoJ9+URmq1q58jsk/XcbJB5EAXOiDlpVIFTdBM2lwPChWG6rRUb
         MrDfvbiKMUoicdtXtqOkRHEVMyC4CA3gEtMDvN7RreAqqgwrWYAEJoBrhgZzx6Wt+ldb
         w/IuWlaIK8rare8zpfbHX1m2MFqikYcB5Dfi7WWjdUjwTiyTnL1JND3wAso32iY1hU8D
         bEBrEFYiENO1+PTVNIZfeq4uYG8vTpNiKRYOWllfujMQ96QAxYMMd8KMCghlX8dpSHYp
         52lfp9R6ACFukO50dHwETejvSpcZ//b15Cc3F7pycDUniHRGSlAI6SyhobEgEDVQvski
         m90A==
X-Forwarded-Encrypted: i=1; AJvYcCVlVKEirZm5aGNu/GDqVZnO9YdQmzVd6Md4iWBZYdbB2gxPBCVKnCnh1au1ffQroAI76xEXuWMHe0ry8jU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBd5JsvOgT9QJCIkZkAvjmYH1hW4+5CJYQDb9pyI7H+m1NVWSs
	KUMXLhIpbVHH6UdEeKwlfDUYGlCOGK7OFD9T14uR46Pyw0Prrdiq6W9mkfDbfOXTPb9LfrHUwYF
	wMvznOdFlfOcJNQd+4+reqM0DApiq8gSIBspeJ4+ZSZNRlrroNV+fKkMLPQg/9b8KKRLRyS6v0c
	JYwfIzuoyjDl4gRfLhZtz2q+22SXilgf+bkSkQRjryUQ==
X-Gm-Gg: ASbGncsPgps3ijr5mcbB3jhYPsIcuhrBoKxkxo5xK6et2ECnjD1kKgjiDBsegwDuu9s
	OQUKf/W7dS9F805c9QVZwrM2ipzRV7qWRDXFjHHyaodPDuffLUZppwIMKKjmAy4VU0Ek5OinLvp
	s+Iw+vSsJmDB63bm1KB8u4mQ==
X-Received: by 2002:a05:6402:20c9:b0:607:f257:ad1e with SMTP id 4fb4d7f45d1cf-611e84ad4e9mr2950269a12.22.1752267750345;
        Fri, 11 Jul 2025 14:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH83FFTu2jsAw1nlpLlMtsjXIeiEGRxdDqdXdoTELtLHJ1dyi7MtcZP+zW6IgfrCrgu9h4FoDwTNGHCP3jNFNM=
X-Received: by 2002:a05:6402:20c9:b0:607:f257:ad1e with SMTP id
 4fb4d7f45d1cf-611e84ad4e9mr2950253a12.22.1752267749955; Fri, 11 Jul 2025
 14:02:29 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250711053509.194751-1-thuth@redhat.com> <2025071125-talon-clammy-4971@gregkh>
 <9f7242e8-1082-4a5d-bb6e-a80106d1b1f9@redhat.com> <2025071152-name-spoon-88e8@gregkh>
 <aHC-Ke2oLri_m7p6@infradead.org> <2025071119-important-convene-ab85@gregkh>
In-Reply-To: <2025071119-important-convene-ab85@gregkh>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 11 Jul 2025 17:02:18 -0400
X-Gm-Features: Ac12FXx9o38iv3wKGucEiB-BlcHSskPmrdROt4FLG3oX4rus7oZ3AtWQf9LYTm8
Message-ID: <CAC1cPGx0Chmz3s+rd5AJAPNCuoyZX-AGC=hfp9JPAG_-H_J6vw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc: Replace the obsolete address of the FSF
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Thomas Huth <thuth@redhat.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-spdx@vger.kernel.org, 
	J Lovejoy <opensource@jilayne.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vN5439Lq-9OoXo-2r9jpHRWm2Kv5AzuMcheT8_5sf2A_1752267750
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 3:38=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 11, 2025 at 12:32:57AM -0700, Christoph Hellwig wrote:
> > On Fri, Jul 11, 2025 at 09:30:31AM +0200, Greg Kroah-Hartman wrote:
> > > That's a crazy exception, and one that should probably be talked abou=
t
> > > with the FSF to determine exactly what the SPDX lines should be.
> >
> > It is called the libgcc exception and has been around forever for the
> > files in libgcc.a that a lot of these low-level kernel helpers were
> > copied from as the kernel doesn't link libgcc.
>
> Ah, so it would be something like this exception:
>         https://spdx.org/licenses/GCC-exception-2.0.html
> but the wording doesn't seem to match.
>
> I'll let the license lawyers figure this out, thanks for the hint!

This one

 * In addition to the permissions in the GNU General Public License, the
 * Free Software Foundation gives you unlimited permission to link the
 * compiled version of this file with other programs, and to distribute
 * those programs without any restriction coming from the use of this
 * file.  (The General Public License restrictions do apply in other
 * respects; for example, they cover modification of the file, and
 * distribution when not linked into another program.)

is `GCC-exception-2.0`

while this one:

 *    As a special exception, if you link this library with files
 *    compiled with GCC to produce an executable, this does not cause
 *    the resulting executable to be covered by the GNU General Public Lice=
nse.
 *    This exception does not however invalidate any other reasons why
 *    the executable file might be covered by the GNU General Public Licens=
e.

does not seem to be in the SPDX exception list. It is very similar to
`GNU-compiler-exception` except it specifically mentions GCC instead
of saying "a GNU compiler".

Alerting Jilayne by cc.

Also, and a question I remember wondering about a while ago, I don't
know how SPDX treats situations where, as apparently in this case,
more than one exception applies to a license grant. I don't think SPDX
syntax allows `GPL-2.0-or-later WITH GCC-exception-2.0 WITH
{some-additional-SPDX-exception}` or
`GPL-2.0-or-later WITH GCC-exception-2.0 AND {some
additional-SPDX-exception}`, i.e. I think SPDX assumes that only one
exception will ever apply in a given case, although the `AdditionRef-`
construct provides one way of dealing with this.

Richard


