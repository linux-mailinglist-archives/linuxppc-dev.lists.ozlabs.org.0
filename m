Return-Path: <linuxppc-dev+bounces-13420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4A2C12F1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 06:32:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwfCq3ZDXz3fqc;
	Tue, 28 Oct 2025 16:32:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761629575;
	cv=none; b=gDFfcCuzGNawHCwcPMGaeDrRh0E6D61dsAkQR23fl/bdEddOAKh9FjygmiL1fE+sN8oCkZ0VPHYmnsIFK62Mt/R0T2b9W/+f12TehEMz4foJmEOSN153Yd08eGjx06P6RxqPN1K/XjF+da6/kqhpLjoYMIuBm35N5saIbsAbEMX1GniYfGZ7AWbE4i4vqhDDWVRKxM0ZGRWWyFjhbEw6eIsTLHfGQIi8jz3ga0gr/TOonN/eLUsJtjefJx6ITR/NWLWI2DI0FNzq7Gdt8pA+S1y1q1UZ1LA3vUs8AB5jn1PJ3IeYTlJL4I8TlwhcESxTZ9E14BCGLxtyDXjBS+7wKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761629575; c=relaxed/relaxed;
	bh=3Wy1ynDaI6taIoYDlBwI1sYFOXKyWHxR4eO6K9jXR3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzmgS4TdR7FywGDYWHzINcMpD0RtNPGtdLHzhTLJZPm86ljaTKCKq6dRtmOu6rXc6NXnu3bXadF2gBQuibIkVzuhButqDKTzudOtZpiGWhuCUyaClawUQNWWjCqh/3zNQpNWGh2DYqOBI7hIh0hmwwPK6Ds2ujOOtK66jAw2HeFiqpUF3qtiRy9uege2GdQoQZn5olMQETAUHcrs6C+5xdo+038IHudQTfOk7ZbFkZE4nCfhO83lmPYIetJeQR3k8TfW7rqHDkmlRPAk8qJj8YftFAtGDPFtlK9EnMyipoAo4u6QM2wvwlYvy3mL4hz95YiPNKX1b0WU1+vH9tFgHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DbyS/+vy; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DbyS/+vy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwfCn5YBfz3fqZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 16:32:52 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1309805566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 22:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761629567; x=1762234367; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wy1ynDaI6taIoYDlBwI1sYFOXKyWHxR4eO6K9jXR3Y=;
        b=DbyS/+vyusD5K27VGwl4GJi8dN1nehFl6EYm++6S49HgOreL+adbwUlxbuj3NWj6/U
         8X49nLlTsKKfU27hA/f/1GKVA2WmNbhQlciWucP68hruh7RgQb4oeDR3x+B6trPVCP1b
         KSYJKvvfLlp7HGDIWDX1V9T3ndQj1aTeSoaf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761629567; x=1762234367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Wy1ynDaI6taIoYDlBwI1sYFOXKyWHxR4eO6K9jXR3Y=;
        b=Rq/yhxegOedH4wt2VrEr4m4IWtxw+iNfy0/AnwsbEGKH0foKsvJzwf7S4rJTQJa067
         6tztgxzg3BRnRlDq3VA6z1xl/1+TMVdeqJlmRTBtLUCs9akmL72PNiW33z4VaVtCkUX/
         8jZtAOiL6CUOpw07nmAFZLSprQyoYHalPyz89I20nSJT7av9ZJEF1DuvEY0ffyh0o9u6
         MmV1LZsVMiKa0S9yv5laeRVkmASdFwzs4XesASzJ2X8HKMLN4L6JeIuPF8dAL5YykEWk
         +e7yvSwOAnGBLIFlRutYMepIv7GYeZ+QmE5BToHLYK7paCBuof+u87SfUD63MH9drOf5
         Zlxw==
X-Forwarded-Encrypted: i=1; AJvYcCWSkySTUbLNR3hSxh28ej6M1GzhmucYv0O2HUZWek1fT64q7TG34JUGbLF6tc6MhmVX6KvudSq0Le4ckN0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzu5JAjrGeF3aIEAH/WfPB817y1/Dd5S9m2+fjoJuV+wzozcb5b
	XD3CNW98RKPFbUxbcdB+RG9uuWaOldJ7JrwXhoaZB7AgIGCw2y21adfKbq136G2yee6E7CahFQY
	xtAO58btzBQ==
X-Gm-Gg: ASbGncuiSaHK5jSPVtMA9ozzHkodc4pXkoy9djD+uJ4BMldmc9JSstdQ9Qg7HR2z0JQ
	lG3ZMUhYeveAEnU+SWgyvgoSJd5+kYnq1jHKa7215opodRVNbEUsBgoviGexktu8Cn3Z987QAQy
	aWa4Hpm2qr+1iMm4wJykjNeypQ9YsHN+o13BdRxQLqXWLdnG6JuaZM0EhnT3gUJgXoqazLNNm7U
	+EEPa6DGozLUf+F8lljR2SLDoUGZ+Qyk8RSoFA5p9O7P1nsaC87jDtoMusbk9N/p9MCOTkFEK1W
	Jh4dYhxRthIIVhuP/b2sVDfACiAeElqTYLXl1b2z6yh5aEILgKyzxx1T2tFgUKCfZKFdxt4jGKu
	SyJg3IVMF1aYn7hfVOejceSwDOKN0iQ++NpFMekkLdmfhAbRmJXx1JBqSa9ssAZG2A8wWHqMDMy
	70sN30IwDHzxQahYUdmIQoLxdWO4a7RDh4bneCo5urwGsUN1tCmG8kfqeFAgzY
X-Google-Smtp-Source: AGHT+IHzmrFBmO1kTKPuC8gSGBoUbjQ9DqrpEyWqSdedpm3Rn+mUejZaEexBBN/A1DAZv6Omt4qY8w==
X-Received: by 2002:a17:907:9723:b0:b6d:801a:648 with SMTP id a640c23a62f3a-b6dba59a7e8mr270767266b.48.1761629567005;
        Mon, 27 Oct 2025 22:32:47 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6db9b86c80sm227772566b.43.2025.10.27.22.32.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:32:45 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63bf76fc9faso9824757a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 22:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0i1FnO5dA3fgA26CMLVmBctZE009Fn4oEyTt+NKm3DHyLKLZC7RvvsE1eu7gs6/J1WKqFGTix+kKr5+s=@lists.ozlabs.org
X-Received: by 2002:a05:6402:5346:20b0:63c:1e15:b9fb with SMTP id
 4fb4d7f45d1cf-63ed84d11b8mr1725392a12.22.1761629565035; Mon, 27 Oct 2025
 22:32:45 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-32-viro@zeniv.linux.org.uk> <20251028015553.GM2441659@ZenIV>
In-Reply-To: <20251028015553.GM2441659@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 22:32:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCnWNXcmZAgxfV9p8rKJfjxcceNzaxia41f675+yEdfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkREqIMu_f1B9dwguEOjRWmmtrQM-BuU5ACiXPx-fVfEkz6aAECfx6yPOQ
Message-ID: <CAHk-=whCnWNXcmZAgxfV9p8rKJfjxcceNzaxia41f675+yEdfA@mail.gmail.com>
Subject: Re: [PATCH v2 31/50] convert autofs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 27 Oct 2025 at 18:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, is there any reason why autofs_dir_unlink() does not update
> ctime of the parent directory?

An autofs 'rmdir' is really just an expire, isn't it? It doesn't
really change anything in the parent, and a lookup will just reinstate
the directory.

So I'd go the other way, and say that the strange thing is that it
changes mtime...

That said, exactly *because* it changes mtime, I think the real answer
is that none of this matters, and it's probably just an oversight, and
it could easily go either way.

               Linus

