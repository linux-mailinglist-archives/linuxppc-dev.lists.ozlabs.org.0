Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F3174482
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 03:39:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TrFd6WsPzDrPY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 13:39:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=COXUz8wr; dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TrCx4KmFzDrCG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 13:37:25 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id 59so4447507otp.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 18:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ITMvxEpF3U14e+p5rYvz2uAWn2wYdTAj3ePDO83aSxA=;
 b=COXUz8wrKXgMXMUxmrS8VUhJezNMzBmQjpV5dwDh/i+YkUM806HuZekPkwS5o4M7fm
 uvQJqIwlEsKumXOHWa8o+BCjvrMM4LilTFplxGZpw58qfkgfPk3fViwRfo2CBQmnEuO8
 9vQmrx2R8/pLCQ0re6/vCPewSDRITFJEo+aeLzLuH8ZZWHmUvScaB61P75PoDvYOqc7u
 Awx3BYeUSvP/ToW0pBKvwN9C9W7qWKMBwkLQ7bQ+Dw94q8dRRdIFfO47fSm9R5mizW5R
 kKJVU6xpnF/NQ2bPNzS/vCmQAMc7MQpkaQAfPqihJuT1Y9GcudGbDT7gISWdb1i8u+T9
 iygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ITMvxEpF3U14e+p5rYvz2uAWn2wYdTAj3ePDO83aSxA=;
 b=ZqEIS6s5lc4qKewaRaAqxkTAfGnhgtS93BnOvAhVJW8h2yq6FJpAKlltjg/WNlaVro
 rey79IRVGwEXW0Y+6mYF1BMYOkseqSXQ7CDBYXo2bnT12kJ/1nS+SMbr1djJhzRN3oCX
 hylykTyZDrc6bv1yBwmbb+nixLukPumyLmeYvySRnRXKsVYKu8XVItp09rqkfyzIhtnB
 W2hWBI3Yd4Z/17sP2Ejk4rlCFqXv0woVtD5GG9usdsHKpSILuvYpcS0tE+7QWkIsAhwF
 bvfauQ3PKnsdLEWECcDbx7tptWVS5Q7HPS2uTFSZQGqW9OE5wpms2S/LqOC/t7pHG/YA
 SKyQ==
X-Gm-Message-State: APjAAAXWKxoZVyc26WJ/UWJCQKDIim4dLuhof+0h/ghJKb+T3BDOdkep
 02INYz15vl50/Ye1V1K0hhbqUGzaoyK36kVsT/fo1g==
X-Google-Smtp-Source: APXvYqyB6AhqVgT1u2YbER/cAyCne1ILQtW1fjnZWNmWga05aw8cTU/5CT3D3ukg3CNy+1E3LbRq2ASMNkjj0A4l+jY=
X-Received: by 2002:a9d:5d09:: with SMTP id b9mr5495369oti.207.1582943842190; 
 Fri, 28 Feb 2020 18:37:22 -0800 (PST)
MIME-Version: 1.0
References: <20200122155304.120733-1-vaibhav@linux.ibm.com>
 <x49r1yrboh2.fsf@segfault.boston.devel.redhat.com>
 <CAPcyv4gn1M87AnuzOEorihG1nmCiHDKL0Z4HfLbNbkeOcO3GPw@mail.gmail.com>
In-Reply-To: <CAPcyv4gn1M87AnuzOEorihG1nmCiHDKL0Z4HfLbNbkeOcO3GPw@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Feb 2020 18:37:11 -0800
Message-ID: <CAPcyv4hE_FG0YZXJVA1G=CBq8b9e0K54jxk5Sq5UKU-dnWT2Kg@mail.gmail.com>
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

On Tue, Feb 18, 2020 at 1:03 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Tue, Feb 18, 2020 at 1:00 PM Jeff Moyer <jmoyer@redhat.com> wrote:
> >
> > Vaibhav Jain <vaibhav@linux.ibm.com> writes:
> >
> > > Presently the error code returned via out variable 'cmd_rc' from the
> > > nvdimm-bus controller function is ignored when called from
> > > __nd_ioctl() and never communicated back to user-space code that called
> > > an ioctl on dimm/bus.
> > >
> > > This minor patch updates __nd_ioctl() to propagate the value of out
> > > variable 'cmd_rc' back to user-space in case it reports an error.
> > >
> > > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > > ---
> > >  drivers/nvdimm/bus.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> > > index a8b515968569..5b687a27fdf2 100644
> > > --- a/drivers/nvdimm/bus.c
> > > +++ b/drivers/nvdimm/bus.c
> > > @@ -1153,6 +1153,11 @@ static int __nd_ioctl(struct nvdimm_bus *nvdimm_bus, struct nvdimm *nvdimm,
> > >       if (rc < 0)
> > >               goto out_unlock;
> > >
> > > +     if (cmd_rc < 0) {
> > > +             rc = cmd_rc;
> > > +             goto out_unlock;
> > > +     }
> > > +
> > >       if (!nvdimm && cmd == ND_CMD_CLEAR_ERROR && cmd_rc >= 0) {
> > >               struct nd_cmd_clear_error *clear_err = buf;
> >
> > Looks good to me.
> >
> > Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
>
> Applied.

Unapplied. This breaks the NVDIMM unit test, and now that I look
closer you are likely overlooking the fact that cmd_rc is a
translation of the firmware status, while the ioctl rc is whether the
command was successfully submitted. If you want the equivalent of
cmd_rc in userspace you need to translate the firmware status. See
ndctl_cmd_submit_xlat() in libndctl as an example of how the
equivalent of cmd_rc is generated from the firmware status.
