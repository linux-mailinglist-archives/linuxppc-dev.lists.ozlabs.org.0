Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5286D1419
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 02:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pnh801cP7z3fT7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 11:32:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bPflKkHy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=justintee8345@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bPflKkHy;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Png3B3wGKz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 10:43:17 +1100 (AEDT)
Received: by mail-yb1-xb34.google.com with SMTP id z83so25623761ybb.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680219793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcZqAGUTPeSkDw23rK6dbBPBzMq/2/SptfrVxtDB0UQ=;
        b=bPflKkHyODU8uuehrKfUxhncuo2AuQrCOUht50s5CP3/L5DWLKNVwCzJiTEaTHDA2R
         W8PNyNrEL/0WuHRgTIyQeHwGjj3WYh/uc7eHmXOP2Kh0AN+uxMqgTjoR3Kn9SorMT9Xa
         BfwCqqF98FxGxSGu5FYlwvOEc0tA51r61ZxLW00pRti5pfB/oy40Wd6fMETOY3FJusUT
         VYxs32cXpTrNn3hevQUPsImIy8gUaJ4HrTXAx4x1ol/idJy9N3HmWOkgyKDe9Yu4aWTD
         gS4+6/d5JLC7opUHk4WN7PMB8OjJ92hP00c9kz7k94SGP6D/hVQB9e7W+S1kT5ou6+wb
         o/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680219793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcZqAGUTPeSkDw23rK6dbBPBzMq/2/SptfrVxtDB0UQ=;
        b=rU5FomUWIYyTTtC6oJMeFwwph7BvzOiy4sE1xAaCUgfQWfNHkwlZxVv+eSALaUOQNv
         PlQfqC6OdOSrKtRnJjdM3SNyNdykPzfTBwbVSDHogzejPdJBCS4DcdSEYNduteM/qP8h
         n6Ux5USZ2DJHqYF18ByQSpUGHFMaSGCU9H+h496P62kwhLnQWy8DmJlE0uOJTpMK7FLq
         coISoKlgQ72a9QI+0/6j6Q08RUImX0CCTrkl3uo+BaIKrRs/3jSen9j98/otrwM1uwBV
         /AHBVzdEmWogicyizUxmHNKe8MM4Ve/FWkZeTIseY/6CwQfCUuc0OfnPruXa2R5bzGk+
         H7Og==
X-Gm-Message-State: AAQBX9drXwn3tnq9vvFmKZJUZdfmCyRY9m0hpf+weTnyEimiHasQteHr
	coHGcobDm5jXSBz+fiFJhCJO3U7imx8RAZuVe9g=
X-Google-Smtp-Source: AKy350bqbzF6SrzHXSyol3UEFAY9jZj8xOWQlhMA5/OcrMr1OSBWBXFKxpU7bojSxQYKftTBFL5H45EMrnAbNzqKWXQ=
X-Received: by 2002:a05:6902:1141:b0:b73:caa7:f06f with SMTP id
 p1-20020a056902114100b00b73caa7f06fmr16639952ybu.5.1680219792765; Thu, 30 Mar
 2023 16:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221206221335.GA1363005@bhelgaas> <20230315213537.GA1788623@bhelgaas>
In-Reply-To: <20230315213537.GA1788623@bhelgaas>
From: Justin Tee <justintee8345@gmail.com>
Date: Thu, 30 Mar 2023 16:43:01 -0700
Message-ID: <CABPRKS-kMVpEEdJPR6_ru6hjqyjxcVaR+FRWNGS1RRChjeFhCg@mail.gmail.com>
Subject: Re: [PATCH v3 4/9] scsi: lpfc: Change to use pci_aer_clear_uncorrect_error_status()
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 31 Mar 2023 11:31:50 +1100
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, Justin Tee <justin.tee@broadcom.com>, linux-pci@vger.kernel.org, jejb@linux.ibm.com, Zhuo Chen <chenzhuo.1@bytedance.com>, James Smart <james.smart@broadcom.com>, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, ruscur@russell.cc, bhelgaas@google.com, dave.jiang@intel.com, jdmason@kudzu.us, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Bjorn,

> But lpfc_aer_cleanup_state() is visible in the
> "lpfc_aer_state_cleanup" sysfs file, so removing it would break any
> userspace that uses it.
>
> If we can rely on the PCI core to clean up AER errors itself
> (admittedly, that might be a big "if"), maybe lpfc_aer_cleanup_state()
> could just become a no-op?
>
> Any comment from the LPFC folks?

We have notified all users of the lpfc_aer_cleanup_state sysfs entry,
and Broadcom LPFC is okay to no-op.

Regards,
Justin

On Wed, Mar 15, 2023 at 2:39=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Tue, Dec 06, 2022 at 04:13:35PM -0600, Bjorn Helgaas wrote:
> > On Wed, Sep 28, 2022 at 06:59:41PM +0800, Zhuo Chen wrote:
> > > lpfc_aer_cleanup_state() requires clearing both fatal and non-fatal
> > > uncorrectable error status.
> >
> > I don't know what the point of lpfc_aer_cleanup_state() is.  AER
> > errors should be handled and cleared by the PCI core, not by
> > individual drivers.  Only lpfc, liquidio, and sky2 touch
> > PCI_ERR_UNCOR_STATUS.
> >
> > But lpfc_aer_cleanup_state() is visible in the
> > "lpfc_aer_state_cleanup" sysfs file, so removing it would break any
> > userspace that uses it.
> >
> > If we can rely on the PCI core to clean up AER errors itself
> > (admittedly, that might be a big "if"), maybe lpfc_aer_cleanup_state()
> > could just become a no-op?
> >
> > Any comment from the LPFC folks?
> >
> > Ideally, I would rather not export pci_aer_clear_nonfatal_status() or
> > pci_aer_clear_uncorrect_error_status() outside the PCI core at all.
>
> Resurrecting this old thread.  Zhuo, can you figure out where the PCI
> core clears these errors, include that in the commit log, and propose
> a patch that makes lpfc_aer_cleanup_state() a no-op, by removing the
> pci_aer_clear_nonfatal_status() call completely?
>
> Such a patch could be sent to the SCSI maintainers since it doesn't
> involve the PCI core.
>
> If it turns out that the PCI core *doesn't* clear these errors, we
> should figure out *why* it doesn't and try to change the PCI core so
> it does.
>
> > > But using pci_aer_clear_nonfatal_status()
> > > will only clear non-fatal error status. To clear both fatal and
> > > non-fatal error status, use pci_aer_clear_uncorrect_error_status().
> > >
> > > Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> > > ---
> > >  drivers/scsi/lpfc/lpfc_attr.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_a=
ttr.c
> > > index 09cf2cd0ae60..d835cc0ba153 100644
> > > --- a/drivers/scsi/lpfc/lpfc_attr.c
> > > +++ b/drivers/scsi/lpfc/lpfc_attr.c
> > > @@ -4689,7 +4689,7 @@ static DEVICE_ATTR_RW(lpfc_aer_support);
> > >   * Description:
> > >   * If the @buf contains 1 and the device currently has the AER suppo=
rt
> > >   * enabled, then invokes the kernel AER helper routine
> > > - * pci_aer_clear_nonfatal_status() to clean up the uncorrectable
> > > + * pci_aer_clear_uncorrect_error_status() to clean up the uncorrecta=
ble
> > >   * error status register.
> > >   *
> > >   * Notes:
> > > @@ -4715,7 +4715,7 @@ lpfc_aer_cleanup_state(struct device *dev, stru=
ct device_attribute *attr,
> > >             return -EINVAL;
> > >
> > >     if (phba->hba_flag & HBA_AER_ENABLED)
> > > -           rc =3D pci_aer_clear_nonfatal_status(phba->pcidev);
> > > +           rc =3D pci_aer_clear_uncorrect_error_status(phba->pcidev)=
;
> > >
> > >     if (rc =3D=3D 0)
> > >             return strlen(buf);
> > > --
> > > 2.30.1 (Apple Git-130)
> > >
