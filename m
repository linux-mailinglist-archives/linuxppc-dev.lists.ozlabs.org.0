Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E119EF0D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 03:18:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wXj95yy0zDqV7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:18:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GkHHIbyO; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wXdn19fszDqsL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 11:15:08 +1000 (AEST)
Received: by mail-il1-x141.google.com with SMTP id i75so13065415ild.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 18:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbprTDW1u1HJSZmzEjh4jO7mD74iEgUk0lP0fkv1P5U=;
 b=GkHHIbyOBZRFRpN+beehXEmD1sX8a7TvGoNIJPqJz4BdB4IxJwMEqZNFt9lt95Lewc
 k+kP9/qc/H0akb0VM1N/pFTzJKtGebCHlxGPab+9fUPwdJvzppoM5MD0BNdxER2KONJS
 Ps7ZsmbYXpeaf1qVmQ2b8ekmdbTzyuTTeUdQom+Nvup2XVthSRbyduMQeu1D50/mRkNo
 2YfVErRZ/7MIPh8OmQIroRxNG9Fb51uDv5ThBw43Uz7huaG0zRLbtnQOo2Xvt4yIZiOH
 r8NR59/akimA+OXb+cO8cHFTn4rT4Ew9CEIvsDqDbJFfuaLL1rxYWSRF/Ok6F28H+Kti
 JABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbprTDW1u1HJSZmzEjh4jO7mD74iEgUk0lP0fkv1P5U=;
 b=lig/fS+JO5Rs6P+gbecDWIiKOmLSTfGcK+/09lUScb8wIzjTeaHSwQcHmKI1cU0qvO
 bGFa6/ClVcKQOJwTmR6cVTDlCnsFOQpz4abKHaJwP031cYQm7lKZ94mCuuzEVPAb2ctK
 lnrEeo405PAYwH93RXq8BBg83pO+JAV/Po80L88QRWoEaX/e52kSOqZ7Eymzx81ebuMQ
 wYVdBVDAemWk7Bp77DNeCNECjNyEvZqppyeBm5KVUKf9Fjrn/kKa2UsUPFUXIerbM9hh
 emXGYahQcA3ESNWGlaigoRJnD4OBnT3C+NHFbiMnqkqn09vwP+AzUX5mrkQO3KFeNKHy
 VQxQ==
X-Gm-Message-State: AGi0PuaaAS+QIGwcQNf+/VY647YDqlsdnBdm5oVN2WaBP5lgOlxUIX8n
 EBZ2p0z2GeeMadknTFyz8cCynJyr2Zh8gqgTqvk=
X-Google-Smtp-Source: APiQypKmuujWglLFGvt6mgZTt0c2Lfo3xvnJLGSPMnshz82WbFzycEx19jZVaLgsryxjZKYQCznynOkynrPgvYkFPSs=
X-Received: by 2002:a92:5b56:: with SMTP id p83mr19231598ilb.70.1586135705788; 
 Sun, 05 Apr 2020 18:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <a2e4aca0-8e3a-2496-b9a3-ccacf41fd3d9@web.de>
In-Reply-To: <a2e4aca0-8e3a-2496-b9a3-ccacf41fd3d9@web.de>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Mon, 6 Apr 2020 09:14:52 +0800
Message-ID: <CAJRQjod7jVRrAEmk1=qgVf5RH5oedmLC4n7Ujsh-G7sosesGDw@mail.gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Remove NULL check before kfree
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: Chen Zhou <chenzhou10@huawei.com>, LKML <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry about noise, please just ignore it.

On Mon, Apr 6, 2020 at 4:50 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > NULL check before kfree is unnecessary, so remove it.
>
> Would you like to take similar update suggestions into account?
> * 2019-09-04
>   KVM: PPC: Book3S HV: Delete an unnecessary check before kfree() in __kvmhv_nested_page_fault()
>
> * [-next] KVM: PPC: Book3S HV: remove redundant NULL check
>   https://lkml.kernel.org/lkml/20200401130903.6576-1-chenzhou10@huawei.com/
>   https://lore.kernel.org/patchwork/patch/1218800/
>
> Regards,
> Markus
