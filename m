Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8C27BD11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 08:23:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0q8V03pXzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 16:23:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ew2tZPZp; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0pyW5jh3zDqVT;
 Tue, 29 Sep 2020 16:14:59 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id ay8so5034252edb.8;
 Mon, 28 Sep 2020 23:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0ExX5FIsJQ8KTZLNWngsAePqqvjIirvnQMV0CRsO47c=;
 b=ew2tZPZp9D5kQDTCshU10JlSO13YhgBlaoh5JEC6n6V/vu99yLehNiutg0khbZQCKR
 G/+fLLSakk9Cy1DDMqtKTbuDFB1dKbUPlEFBt8t/kQ/oOwJWskoW8F890vef+GcU/Gpn
 B8IH8WPqMNooY6fPUr4zTvPdxr//DK0mgq69U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0ExX5FIsJQ8KTZLNWngsAePqqvjIirvnQMV0CRsO47c=;
 b=Ux50XmabICtZr8jbv2lmi06z6xkIeiF6a23RWCkiwrYKrOzMqP8860vq2iaYyjXf+5
 SeVzjzDqYVMshIRDhfIBzspXAQioIIm9byrpvDhT4rGBKnF0tI34XzDj26Vlvmgsve+h
 vWl79eVGk2oU0e7yYnE7UWOXyGt/gbTml9acufuxG0EAiE0fq2aU5G8S4PAVegYh7IgX
 JuqtA14LvJuzFSvmi0a89J/5YKYjGLlHeetfI+uz2J8qFdQpE8T6Pw7fSiNU75qvlwpW
 sNWnPNG7BgWhTesZyhc1LZf2BhZ02381bZ/Yan5s98tpbl3aRQzbSkMWlL8FRTlLqwHI
 194Q==
X-Gm-Message-State: AOAM5331YNU72tWouIPvzWdzDbZgWH5lEzAajj/y/LkM2uJebGuu8tOc
 j+NZXAoiN1hUUYgQm7oYZWVc4MzVkiReFJNXM2D3nF9eGO4=
X-Google-Smtp-Source: ABdhPJxaPr7VIciRIGwFH7m+F/yZ8j13H81DzAQglyp6Qe5/Z9XeUWpNIK9uwz9yIFE89HXOQySxcv4ZrE7wXRGCL9w=
X-Received: by 2002:a05:6402:17b6:: with SMTP id
 j22mr1437896edy.377.1601360095624; 
 Mon, 28 Sep 2020 23:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <1600885506-18734-1-git-send-email-nayna@linux.ibm.com>
 <8dc1ad002dcdc02122725dcc3ba27e1fd8c78b78.camel@linux.ibm.com>
In-Reply-To: <8dc1ad002dcdc02122725dcc3ba27e1fd8c78b78.camel@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Sep 2020 06:14:43 +0000
Message-ID: <CACPK8XdeAzbXcm2w6kJuAQzckdyFQ2P9h+fC36ZArpkubqC1mg@mail.gmail.com>
Subject: Re: [PATCH] linux: configure CONFIG_I2C_OPAL as in-built.
To: Mimi Zohar <zohar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: openpower-firmware@lists.ozlabs.org, Nayna Jain <nayna@linux.ibm.com>,
 klaus@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 25 Sep 2020 at 18:19, Mimi Zohar <zohar@linux.ibm.com> wrote:
>
> Hi Nayna,
>
> On Wed, 2020-09-23 at 14:25 -0400, Nayna Jain wrote:
> > Currently, skiroot_defconfig CONFIG_I2C_OPAL is built as a loadable
> > module rather than builtin, even if CONFIG_I2C=y is defined. This
> > results in a delay in the TPM initialization, causing IMA to go into
> > TPM bypass mode. As a result, the IMA measurements are added to the
> > measurement list, but do not extend the TPM. Because of this, it is
> > impossible to verify or attest to the system's integrity, either from
> > skiroot or the target Host OS.
>
> The patch description is good, but perhaps we could provide a bit more
> context before.
>
> The concept of trusted boot requires the measurement to be added to the
> measurement list and extend the TPM, prior to allowing access to the
> file. By allowing access to a file before its measurement is included
> in the measurement list and extended into the TPM PCR, a malicious file
> could potentially prevent its own measurement from being added. As the
> PCRs are tamper proof, measuring and extending the TPM prior to giving
> access to the file, guarantees that all file measurements are included
> in the measurement list, including the malicious file.
>
> IMA needs to be enabled before any files are accessed in order to
> verify a file's integrity and extend the TPM with the file
> measurement.  Queueing file measurements breaks the measure and extend,
> before usage, trusted boot paradigm.
>
> The ima-evm-utils package includes a test for walking the IMA
> measurement list, calculating the expected TPM PCRs, and comparing the
> calculated PCR values with the physical TPM.  Testing is important to
> ensure the TPM is initialized prior to IMA.  Failure to validate the
> IMA measurement list may indicate IMA went into TPM bypass mode, like
> in this case.

Thanks for the explanation Mimi. It's lucky that the TPM drivers can
be loaded early enough!

Should we add something like this to security/integrity/ima/Kconfig?

select I2C_OPAL if PPC_POWERNV

It's generally frowned upon to select user visible symbols, but IMA
does this for the TCG options already.

Cheers,

Joel

>
> thanks,
>
> Mimi
>
> >
> > Reported-by: Mimi Zohar <zohar@linux.ibm.com>
> > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> > ---
> >  openpower/configs/linux/skiroot_defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/openpower/configs/linux/skiroot_defconfig b/openpower/configs/linux/skiroot_defconfig
> > index 44309e12..a555adb2 100644
> > --- a/openpower/configs/linux/skiroot_defconfig
> > +++ b/openpower/configs/linux/skiroot_defconfig
> > @@ -216,7 +216,7 @@ CONFIG_I2C=y
> >  CONFIG_I2C_CHARDEV=y
> >  # CONFIG_I2C_HELPER_AUTO is not set
> >  CONFIG_I2C_ALGOBIT=y
> > -CONFIG_I2C_OPAL=m
> > +CONFIG_I2C_OPAL=y
> >  CONFIG_PPS=y
> >  CONFIG_SENSORS_IBMPOWERNV=m
> >  CONFIG_DRM=m
>
>
