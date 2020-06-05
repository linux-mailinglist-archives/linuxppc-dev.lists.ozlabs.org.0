Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2101F0092
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 21:51:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dtZ66PrkzDr2y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jun 2020 05:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=k/NC3Syq; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dtX24sFFzDr0t
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jun 2020 05:49:31 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id l12so7611274ejn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jun 2020 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KXc03rxQsyL+YifD2Y2tm+lwPD0QRqJ3ku4DKVZ1zc8=;
 b=k/NC3SyqbrnTugxOywTK0FoQRYbykja1Y9Z/Y+Oh0Xayiz4ABW5+oz0RQY8qd5omkK
 MI/zKIbCDsftNm5RInDUsWRSWwbzOvpk89S3IqVCZq2aIcbteePU9QhAlYiox4BD40Uz
 VIGF5ixopOwU4zSKVgOI+DQwI3T3Qin7bxZP7fA64XNH+/QhSfMQGS/0IbGeKvfBHljV
 bvU87+Ogx+1N7HpejbxT9TBt3Opl0zmBmfDr2mzq2irNdnenJ9YOZxKM68IlSopCchb5
 9wbk59DZLIubfgH2ZuHMb5xfhOhcaZmZVUWwrvG6xKXPZo3CLQDgUIOKR4D0enM/jwqF
 IumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KXc03rxQsyL+YifD2Y2tm+lwPD0QRqJ3ku4DKVZ1zc8=;
 b=K51aDlafrEo/Y3Zb+JSKsOyWG02LL+wYs1dfnVgSLrVuOYt6w/Gj4tv4S29Fcxpzus
 tjlG7BqRe0Y8Zplnw/m2J0Y78KSPNQdhiqsbQDGB73SJo8BgjwuMHNYVzXk4sQg8PeR8
 ietwZJsaJvvhCvfJQUL2J7hInSrZSsMLDGta1iOnKbCGtrBupNekufK+2ZaRYNKDbaGy
 qOkC9cPSBpY21qQ/68qB7P/aDBDD4iXiDgWpt3z0/RbqHFfZ3++cR03hnk6JoKshaanF
 YBxbiCDwMp0bNgDHvc9cOFlpeBQ0/SrctmO8jtz6MVnJkn5y3siwMh8PpAKpxtnXlaTh
 Taxw==
X-Gm-Message-State: AOAM533bgk+zYxeRoz1m2CQ6j5VvqP1RPwhZNErOuuNWPRi01vBKpIq3
 GOVrJ/WEh5sW2ymWpR50yyhAblu8hQW0DG34TZYMXg==
X-Google-Smtp-Source: ABdhPJxuZwIa9IoVTuMhbnwTzDt4nAJOGfVaSR8B92lGhn2YN8cJwIHX7v31rQdpN8V9SGgR1+Mc3WTf01eoOyhXsTA=
X-Received: by 2002:a17:906:22d0:: with SMTP id
 q16mr10033033eja.455.1591386567943; 
 Fri, 05 Jun 2020 12:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200604234136.253703-1-vaibhav@linux.ibm.com>
 <20200604234136.253703-5-vaibhav@linux.ibm.com>
 <20200605171313.GO1505637@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20200605171313.GO1505637@iweiny-DESK2.sc.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 5 Jun 2020 12:49:16 -0700
Message-ID: <CAPcyv4g2x7LV3ARRj-RBS1K84WNayr9oDcupzPQ1gtK1A_e+aQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/6] powerpc/papr_scm: Improve error logging and
 handling papr_scm_ndctl()
To: Ira Weiny <ira.weiny@intel.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 5, 2020 at 10:13 AM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Fri, Jun 05, 2020 at 05:11:34AM +0530, Vaibhav Jain wrote:
> > Since papr_scm_ndctl() can be called from outside papr_scm, its
> > exposed to the possibility of receiving NULL as value of 'cmd_rc'
> > argument. This patch updates papr_scm_ndctl() to protect against such
> > possibility by assigning it pointer to a local variable in case cmd_rc
> > == NULL.
> >
> > Finally the patch also updates the 'default' clause of the switch-case
> > block removing a 'return' statement thereby ensuring that value of
> > 'cmd_rc' is always logged when papr_scm_ndctl() returns.
> >
> > Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> > Changelog:
> >
> > v9..v10
> > * New patch in the series
>
> Thanks for making this a separate patch it is easier to see what is going on
> here.
>
> > ---
> >  arch/powerpc/platforms/pseries/papr_scm.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> > index 0c091622b15e..6512fe6a2874 100644
> > --- a/arch/powerpc/platforms/pseries/papr_scm.c
> > +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> > @@ -355,11 +355,16 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> >  {
> >       struct nd_cmd_get_config_size *get_size_hdr;
> >       struct papr_scm_priv *p;
> > +     int rc;
> >
> >       /* Only dimm-specific calls are supported atm */
> >       if (!nvdimm)
> >               return -EINVAL;
> >
> > +     /* Use a local variable in case cmd_rc pointer is NULL */
> > +     if (!cmd_rc)
> > +             cmd_rc = &rc;
> > +
>
> This protects you from the NULL.  However...
>
> >       p = nvdimm_provider_data(nvdimm);
> >
> >       switch (cmd) {
> > @@ -381,12 +386,13 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
> >               break;
> >
> >       default:
> > -             return -EINVAL;
> > +             dev_dbg(&p->pdev->dev, "Unknown command = %d\n", cmd);
> > +             *cmd_rc = -EINVAL;
>
> ... I think you are conflating rc and cmd_rc...
>
> >       }
> >
> >       dev_dbg(&p->pdev->dev, "returned with cmd_rc = %d\n", *cmd_rc);
> >
> > -     return 0;
> > +     return *cmd_rc;
>
> ... this changes the behavior of the current commands.  Now if the underlying
> papr_scm_meta_[get|set]() fails you return that failure as rc rather than 0.
>
> Is that ok?

The expectation is that rc is "did the command get sent to the device,
or did it fail for 'transport' reasons". The role of cmd_rc is to
translate the specific status response of the command into a common
error code. The expectations are:

rc < 0: Error code, Linux terminated the ioctl before talking to hardware

rc == 0: Linux successfully submitted the command to hardware, cmd_rc
is valid for command specific response

rc > 0: Linux successfully submitted the command, but detected that
only a subset of the data was accepted for "write"-style commands, or
that only subset of data was returned for "read"-style commands. I.e.
short-write / short-read semantics. cmd_rc is valid in this case and
its up to userspace to determine if a short transfer is an error or
not.

> Also 'logging cmd_rc' in the invalid cmd case does not seem quite right unless
> you really want rc to be cmd_rc.
>
> The architecture is designed to separate errors which occur in the kernel vs
> errors in the firmware/dimm.  Are they always the same?  The current code
> differentiates them.

Yeah, they're distinct, transport vs end-point / command-specific
status returns.
