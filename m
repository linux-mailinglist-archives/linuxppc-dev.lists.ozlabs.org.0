Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9C678E49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 03:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1B1W2PC7z3c8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 13:36:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DljXljeH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=DljXljeH;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1B0Y1MSBz2xxn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 13:35:38 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso571654pjj.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 18:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFFdm/8SdflDgDT7EHL5t8PZiOZhtttydMh8UNhprb4=;
        b=DljXljeHIhfa+59LOJ4hAD3ygoSHfdrZaGVnay69zUOXkdfICsXb4cgMhpwqNnjhCG
         y9vC1K1TNs5HTGrMEx1Cdz41tV19YBCyRFuHZmFTKWZIWZa8hFZgoW6IroqQfVGp34Do
         3PAiAhFcA8bXF7E/efxSdwBUE6f/rOMUIqF6Oqe/eJ01aHJbnsIxCIQmeTSSgoaYrvUa
         gawICKGlxeAO2geNu5dXDu9H6E4XXAveeayTuxr3dTuSlzUaB5Wd5+Jp482gguDAk5lz
         kidzECHxOj7x93qv4z6iRRdC/EjV9aX6qjrSgw2LBrUul8iAv0kvUy1HLs64r/0VWJF1
         J7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yFFdm/8SdflDgDT7EHL5t8PZiOZhtttydMh8UNhprb4=;
        b=WFh9tyqTJ2e6++w078GB3koXlj2yWWNFNzgPAWwZm1CGKQwQ59y9H+9BlVOYTRi5Pa
         Ayy9Mrq4owi/C75edEE8zaf4VAGBR4OeklDC3V+oqYMOUHG6Af2qXXkY6wLvKgUG6ReE
         D+2jKcnTBcI/u/hCFeygRbt3iv6+RaGsgvFU+nK9/zLSt16+6jcJVYwAGkIpyY1l93pr
         yvObxbZB3y/WFfAEtCRC2+XhOSM333+OjrGnZagvIwHMQfx41GIiAVkTR2SNGhu4ys/e
         G/MIOh1+VCDWSL5jr3ypp+b4Mi0lMqNAJ+7DYtg8iLumwVET2WbP4C1psOhMiQwQfzVi
         //nA==
X-Gm-Message-State: AFqh2kpIqL0FV+L5I1v4EaWwSKKuX9t9bvFqKwA/SYNpZfqWkuuMBvJz
	p7TtRwfp6wQhrUgA1ocvjv0V1g==
X-Google-Smtp-Source: AMrXdXtc20Q7yx6l6YE87GqKscKRmcgi78OC52SesuBzKXuKXRmKb26Xa1weIba0d1gATTGi5V9Jig==
X-Received: by 2002:a17:902:7041:b0:194:5b98:4342 with SMTP id h1-20020a170902704100b001945b984342mr6614596plt.5.1674527734868;
        Mon, 23 Jan 2023 18:35:34 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id i15-20020a17090332cf00b0019460ac7c6asm376254plr.283.2023.01.23.18.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:35:34 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: jim@jtan.com, geoff@infradead.org, Christoph Hellwig <hch@lst.de>
In-Reply-To: <20230123074718.57951-1-hch@lst.de>
References: <20230123074718.57951-1-hch@lst.de>
Subject: Re: [PATCH] ps3vram: remove bio splitting
Message-Id: <167452773403.209579.6087653213240480442.b4-ty@kernel.dk>
Date: Mon, 23 Jan 2023 19:35:34 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Mon, 23 Jan 2023 08:47:18 +0100, Christoph Hellwig wrote:
> ps3vram iterates over the bio one segment, that is page aligned and max
> page sized chunk, a time.  Because of that there is no point in
> calling bio_split_to_limits, or explicitly setting the default limits
> that are only used by bio_split_to_limits.
> 
> 

Applied, thanks!

[1/1] ps3vram: remove bio splitting
      commit: 2192a93eb4ac63eeb37ec5ec5cfa0db92ded5e3c

Best regards,
-- 
Jens Axboe



