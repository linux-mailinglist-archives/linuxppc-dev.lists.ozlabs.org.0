Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76933163482
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 22:13:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48MYV02VqHzDqDY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 08:12:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=Gb5Z8PlH; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MYHN0ZXSzDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 08:03:42 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id v19so21565404oic.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXoVPk6FZ9mk8ebm0RTbrhUVeu0ldQNyqrF7B4ZlAJA=;
 b=Gb5Z8PlHDjWJMmQNVcBojkdyBKcBiB1NeC31O40/pM1cl9s1q8B+ntc7IhLswUS0Jo
 vYF04tfHWKIhvJwr03VbGY8lJWHQj4gva5st2VuIw6OFpKKX0trwouVM1zqgbFNM4yZa
 Gwce0z7qDnGpCCNQAZTGu7HXG0iSPFIQc7dHW1IrXSH9qFWXDv7RccypWNewbkeDVJUK
 rc8xZ1QGrEOCLriBmAky7ZLnsvbkqAGuVXHt+ehHwrUPneT0VtiF5tgZTQ/tRqRMwl9x
 tEMy8pfgautLuC6+qpeGmin6UphGY/cLFt0whtSZPfZyGxsx9xf0Kkf5HkLU2T+9Z3Ec
 9kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXoVPk6FZ9mk8ebm0RTbrhUVeu0ldQNyqrF7B4ZlAJA=;
 b=iOv5ap/bynV1tDOT2O2qKIsfcAbqcWeN/y8I+RJFuW9Ybcp3/T8xY+dvkXW8rCJVzl
 95T9KHs3gGm/xZcoe3oGmO420Q6n1mxMdBx/GLNdZ6C9k5N3UUFMF18nUxk2g9arb5Ve
 704YZjs/htu4B7KeSy/FFoJ2TU0m7N7LiiiEkWEiPZpultq1ymAcmQqbU4+9mJ9LZCpr
 V4QloY4p3zpf4eahLGrwahfirJICX2DiNiLHvOHaaAr+Toqop1tGWktLHluOsMbJ4LTd
 EJ+Fxh+CzaxB3dW5WU8ev+4WZ9zh6Df77zUiYrfpwOUsRd6n1c+GBwh6tL0THuRV2x9g
 z8lw==
X-Gm-Message-State: APjAAAVQgZa80bTgV6/55vmZa+2++Hmo06eWn3hI8iRy9mLh58MpRy9Z
 5cy5hG2eaS6dzQ9ZFPkgcQVlLHIhzFlxNhgRMFvWGg==
X-Google-Smtp-Source: APXvYqwJcarT38gaI5tYPX5esX/lkmHsUI9w2SbFK2zhB8wSEZI/8fsDx34f/gONLYMRT9XzKxZ1sSVhKi4qcNrIkX8=
X-Received: by 2002:aca:3f54:: with SMTP id m81mr2442260oia.73.1582059818155; 
 Tue, 18 Feb 2020 13:03:38 -0800 (PST)
MIME-Version: 1.0
References: <20200122155304.120733-1-vaibhav@linux.ibm.com>
 <x49r1yrboh2.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49r1yrboh2.fsf@segfault.boston.devel.redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 18 Feb 2020 13:03:26 -0800
Message-ID: <CAPcyv4gn1M87AnuzOEorihG1nmCiHDKL0Z4HfLbNbkeOcO3GPw@mail.gmail.com>
Subject: Re: [PATCH] libnvdimm/bus: return the outvar 'cmd_rc' error code in
 __nd_ioctl()
To: Jeff Moyer <jmoyer@redhat.com>
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 18, 2020 at 1:00 PM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
> > Presently the error code returned via out variable 'cmd_rc' from the
> > nvdimm-bus controller function is ignored when called from
> > __nd_ioctl() and never communicated back to user-space code that called
> > an ioctl on dimm/bus.
> >
> > This minor patch updates __nd_ioctl() to propagate the value of out
> > variable 'cmd_rc' back to user-space in case it reports an error.
> >
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> >  drivers/nvdimm/bus.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> > index a8b515968569..5b687a27fdf2 100644
> > --- a/drivers/nvdimm/bus.c
> > +++ b/drivers/nvdimm/bus.c
> > @@ -1153,6 +1153,11 @@ static int __nd_ioctl(struct nvdimm_bus *nvdimm_bus, struct nvdimm *nvdimm,
> >       if (rc < 0)
> >               goto out_unlock;
> >
> > +     if (cmd_rc < 0) {
> > +             rc = cmd_rc;
> > +             goto out_unlock;
> > +     }
> > +
> >       if (!nvdimm && cmd == ND_CMD_CLEAR_ERROR && cmd_rc >= 0) {
> >               struct nd_cmd_clear_error *clear_err = buf;
>
> Looks good to me.
>
> Reviewed-by: Jeff Moyer <jmoyer@redhat.com>

Applied.
