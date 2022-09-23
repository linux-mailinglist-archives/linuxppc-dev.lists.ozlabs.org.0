Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 885525E8105
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 19:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYzyt23tJz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 03:43:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PdNbfG7d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=paul-moore.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=PdNbfG7d;
	dkim-atps=neutral
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYzyB6h7Nz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 03:42:58 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-130af056397so1264169fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xbj6epvJJhhapTMVuodevN96OG6IhecVF0uzFcA1js8=;
        b=PdNbfG7dLZJPXXVVrSSHaozoV7dVWBYqD6KfJj9NhK2ugy4djDTBaPYwhD2Vv0/Oov
         1UCF3DLjngt6G3egCCdPI26bLOTMe6clFwf1MNrsuZ3K0GfZZRJ8Duy2W9G4voez3lIZ
         fUK5MxfSmOE0fEa8yv6WKDO0IIaRReAQXykoRc0P8jN4vv1yrEud17v1XQkW3cktemg9
         QVK6K8Ft45rbwaew/ArnYpokLoxmrLXeYGYK7zhTPVjZK+B6yHS5Kj4I6s4rHtCYyeEK
         OlxcW7D5ZrSHC0DP55D4XMDKYBlxhLdtgSPjRCcMwDCbqv4Es2F7DxHAFOzM8+kdqqXP
         oqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xbj6epvJJhhapTMVuodevN96OG6IhecVF0uzFcA1js8=;
        b=p3E7z6OdNzPVtqz30wedPLvwM3zlJxUopybO2hQSh9vCdEmNXblPo4ekRPKoJP5wAf
         JTQGspb5CnKMuFXbKsWxD+Swje7sTBfHDjNHRdPobud2j2d3ypBPqnIRTuPcQFv6w8mq
         gCvBnDpxGMeYslFC55S2my4stfaALRdl4ZaTt4gzc8G6NSZOXllXYGD6GVzDVAsTXX2J
         +gGWLQhIJW78Oc0wAUlFHXxO6X1xXl+kYkrCx9ZfHgE+t9u3pvoaTkiFiXuichFtzHw1
         JQm/YdVAFZoxNyzLXGhFnBrENBfJzKy6xHKrv68gzZ2CwQElRxqQBWGeYIvgbdKe65IA
         8Hqw==
X-Gm-Message-State: ACrzQf2lJ5OQS8X0TYQTfz0AjFVcRAcg49eSeHknXMO6f6aY84YCyjKE
	2D3DlfgETuHFPJre9x8Du0+HiJaaKRdF5LqqjbZ9
X-Google-Smtp-Source: AMsMyM4nOntxYIBjWoQA+kOV867HFzXiGgpCE78cV/95Rz3YJow53XHYaEDcWLh0KFgMR8Uyo6DYBMSMy8TBaVBR9AI=
X-Received: by 2002:a05:6870:15c9:b0:101:e18b:d12d with SMTP id
 k9-20020a05687015c900b00101e18bd12dmr12107961oad.51.1663954974870; Fri, 23
 Sep 2022 10:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220922193817.106041-1-nathanl@linux.ibm.com>
 <20220922193817.106041-3-nathanl@linux.ibm.com> <CAHC9VhTWMFbCxQFAEJZzS3Kd5cSFigmvHac5y5ypVU7TqRqpTA@mail.gmail.com>
 <87wn9uzhqr.fsf@mpe.ellerman.id.au> <878rmaqeuw.fsf@linux.ibm.com>
In-Reply-To: <878rmaqeuw.fsf@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 23 Sep 2022 13:42:43 -0400
Message-ID: <CAHC9VhRW5X4-7yOtEbWeMnTCtbnKHW0Nt8BFp8S3M65kFDKXoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/rtas: block error injection when locked down
To: Nathan Lynch <nathanl@linux.ibm.com>
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, jmorris@namei.org, linux-security-module@vger.kernel.org, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 23, 2022 at 11:40 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Paul Moore <paul@paul-moore.com> writes:
> >> On Thu, Sep 22, 2022 at 3:38 PM Nathan Lynch <nathanl@linux.ibm.com> wrote:
> >>>
> >>> The error injection facility on pseries VMs allows corruption of
> >>> arbitrary guest memory, potentially enabling a sufficiently privileged
> >>> user to disable lockdown or perform other modifications of the running
> >>> kernel via the rtas syscall.
> >>>
> >>> Block the PAPR error injection facility from being opened or called
> >>> when locked down.
> >>>
> >>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> >>> ---
> >>>  arch/powerpc/kernel/rtas.c | 25 ++++++++++++++++++++++++-
> >>>  include/linux/security.h   |  1 +
> >>>  security/security.c        |  1 +
> >>>  3 files changed, 26 insertions(+), 1 deletion(-)
> >>
> >> ...
> >>
> >>> diff --git a/include/linux/security.h b/include/linux/security.h
> >>> index 1ca8dbacd3cc..b5d5138ae66a 100644
> >>> --- a/include/linux/security.h
> >>> +++ b/include/linux/security.h
> >>> @@ -123,6 +123,7 @@ enum lockdown_reason {
> >>>         LOCKDOWN_BPF_WRITE_USER,
> >>>         LOCKDOWN_DBG_WRITE_KERNEL,
> >>>         LOCKDOWN_DEVICE_TREE,
> >>> +       LOCKDOWN_RTAS_ERROR_INJECTION,
> >>
> >> With the understanding that I've never heard of RTAS until now, are
> >> there any other RTAS events that would require a lockdown reason?  As
> >> a follow up, is it important to distinguish between different RTAS
> >> lockdown reasons?
>
> 1. Not to my current knowledge.
> 2. Yes, I think so, see below.
>
> >>
> >> I'm trying to determine if we can just call it LOCKDOWN_RTAS.
> >
> > Yes I think we should.
> >
> > Currently it only locks down the error injection calls, not all of RTAS.
> >
> > But firmware can/will add new RTAS calls in future, so it's always
> > possible something will need to be added to the list of things that need
> > to be blocked during lockdown.
> >
> > So I think calling it LOCKDOWN_RTAS would be more general and future
> > proof, and can be read to mean "lockdown the parts of RTAS that need
> > to be locked down".
>
> RTAS provides callable interfaces for a broad variety of functions,
> including device configuration, halt/reboot/suspend, CPU online/offline,
> NVRAM access, firmware upgrade, platform diagnostic data retrieval, and
> others.
>
> Currently I don't know of other RTAS-provided functions that should be
> restricted. But if we were to add more, then -- in answer to Paul -- yes
> I think it would be important to have distinct reasons and
> messages. Taking the point of view of someone diagnosing lockdown denial
> messages and relating them to kernel code and user space activity, I
> would rather we err toward specificity.

As I said before, RTAS is a great mystery to me, if it can be extended
in the future then having a targeted lockdown name makes perfect
sense.

> So a single RTAS catch-all lockdown reason doesn't appeal to me, but
> lockdown reasons and messages aren't ABI (right?) ...

Correct.  Or at least that is my understanding, but there have been
some odd rulings on lockdown in the past so my advice would be to make
*very* sure you get this right the first time.  From what you and
Michael have said, it seems like a function specific name is the way
to go here, and based on your explanations of the situation it seems
like putting this in the integrity bin is the right way to go.

-- 
paul-moore.com
