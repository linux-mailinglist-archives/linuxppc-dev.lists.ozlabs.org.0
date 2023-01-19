Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD4672DE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:16:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ny4Tx54VVz3fDK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 12:16:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m91VX7/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m91VX7/3;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ny4T05MsHz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 12:16:04 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id s13-20020a17090a6e4d00b0022900843652so4344354pjm.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 17:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbDZxGDp8FFFBhm3skdTuca0wCb1RqhnA6hZ3TKJit8=;
        b=m91VX7/3DOiTpb7lvJW92AF59U5cpWwU6ggAKRCUGvVcfgSWDB9SQEa4+AuPlc/ug6
         +XMf3JArGv1o8ktY842QajeWbV/9MtDIPqUVISTALLYEej2cRWueeCdyZqKIoeKaNj49
         fLQKEfWJ7p9SyMwlRlIPGxLzozGjLQ5CLA52smpT2EQjxEXNKCqldz0hb+m+igeKsRF9
         khQAWIW34B+51/9Y1W7A+zc66C0mOSmHQbeKN2wWM7vC+dy+v+eWp7nrHZMwvjufIgj5
         xxtifri2RM3VciVmBbf7F6HY88isNfLKYnDQkgO30fqIq+qxPmJJJwjeaprz+nbKxuqh
         xrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbDZxGDp8FFFBhm3skdTuca0wCb1RqhnA6hZ3TKJit8=;
        b=1O58vyPT7Lbt37h7liRIuC7ZEvraHika0iPDDs99JHDm0XzJNzfOrTPrNExChzmuu3
         5Rt1ipn56DYBMcC6UVdvCf+Q6MpLbarOpFKhN60wOxHDg95PptvJDqO4tMZA1gC83oNz
         a9qtjj88hdesWPAwo0hbGf9ogftdoZLyqF6ChV+QzwUV24DQb8bw/DKEfLi+8Vb3Hn5K
         zZ+duinWhzM3b9gJ/+JcoHcaWekUZXPqFFcvm5maUQ88/2JKy4Jnst3bucGDXc7yyqN2
         kzlG9liCfadKsD3wWOjTJzyukZv/tvmKAGvXU6p28AosbWUeXwcwAusoqQ/BnivIsWgX
         Q2Rw==
X-Gm-Message-State: AFqh2kr9TsjmgTYhXX0THlcaUi0EmDlH8cxjs9JY9JnqgaL+IMqgPD/E
	Ubbnh+Coty9zcNXBFQfyKVPFNeL/zGQ=
X-Google-Smtp-Source: AMrXdXt1QQNOAQpB1Kri+S7V27/Xl104ByL7t0pHQAj/LRNQdRDTMhaBvcDcOaq3Ci4N5vVEYOpbvA==
X-Received: by 2002:a17:902:7209:b0:194:73c4:6bdd with SMTP id ba9-20020a170902720900b0019473c46bddmr9728122plb.17.1674090961806;
        Wed, 18 Jan 2023 17:16:01 -0800 (PST)
Received: from localhost (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id k3-20020a170902694300b00194a53ab3e6sm4235447plt.286.2023.01.18.17.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 17:16:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jan 2023 11:15:54 +1000
Message-Id: <CPVRPRLUQYA6.VGAMPDLW043V@bobo>
Subject: Re: [PATCH v3 13/24] powerpc/pseries: Fix handling of PLPKS object
 flushing timeout
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230118061049.1006141-1-ajd@linux.ibm.com>
 <20230118061049.1006141-14-ajd@linux.ibm.com>
In-Reply-To: <20230118061049.1006141-14-ajd@linux.ibm.com>
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jan 18, 2023 at 4:10 PM AEST, Andrew Donnellan wrote:
> plpks_confirm_object_flushed() uses the H_PKS_CONFIRM_OBJECT_FLUSHED hcal=
l
> to check whether changes to an object in the Platform KeyStore have been
> flushed to non-volatile storage.
>
> The hcall returns two output values, the return code and the flush status=
.
> plpks_confirm_object_flushed() polls the hcall until either the flush
> status has updated, the return code is an error, or a timeout has been
> exceeded.
>
> While we're still polling, the hcall is returning H_SUCCESS (0) as the
> return code. In the timeout case, this means that upon exiting the pollin=
g
> loop, rc is 0, and therefore 0 is returned to the user.
>
> Handle the timeout case separately and return ETIMEDOUT if triggered.
>
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStor=
e")

Can fixes go to the start of the series?

Thanks,
Nick
