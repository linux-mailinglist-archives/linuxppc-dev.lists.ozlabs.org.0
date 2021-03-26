Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F166734AD21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 18:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6T6m755Jz3c6F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 04:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ByeSOipR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=0x7f454c46@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ByeSOipR; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6T6L3SW0z3btb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 04:11:53 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id x13so6327877wrs.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 10:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=H2sIzh/TsuZe/gkJCNiA0CvcXYHRyrIvEdU4dWur6to=;
 b=ByeSOipRbzayJybWf40NjnYhH28cuKft3+B40MC1n2NZe1Drjy66oyqeGpTGALRWpx
 Kl6v/KhDLveC4Ua2qsWejX7uC2qG96aICwXnKJGX90RT1KUwSwt6WlCgmAZC25Kl1zSF
 5Jtq5rjCkdBufjORpYWq9MOXTjEgf0LPwGxsdse9/ePpGHXKQS6bSFA5WmMd/e32KGe1
 bWlzLqdQOEJtbJdPK83QL+NkXBGWxQC1YR+nzTEthyoSr8Nw6lwbWbCjHPjsEMQv4Qwj
 A6pTbhPA4MZWGL1e7GRkAOB18BE25h8BHgfbx/Y5B2X68tP2Vgwd/ifVqDvLc99pmFB8
 HW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H2sIzh/TsuZe/gkJCNiA0CvcXYHRyrIvEdU4dWur6to=;
 b=d8IDSVM2f0PWlhcJJAP8uZmXsFii2dj68kagOXdjQF1Ye80mHQ4eIq+bQLosmH3khG
 BnmxxGcQ9b1DBk5ljKodLXyzZLjCBygyIHgmJd0ShB/ep8DayZZB4ozdqBzbPaBfOro+
 JpURCJaplUXec4Lq6PbB9i55TEHo0qS1ZQlCEYInzDOWrImeihlEe4BG3CVGOEM2Uptu
 8wco2mRyRRUHWBCdN24Y93ZrRmR2yypbE4OAA0ICm07zy5JTCc6hRnaKpJfGDwkl0qgm
 KSqzdbQnRjv/Hcb+PqjgYQ3ZZZifz3mKedCybAC3Nw8eOD5T7N06Nlp3b+dkGogin8Cn
 +ZVg==
X-Gm-Message-State: AOAM531lTvLO9SFpIuksX0TTYV87NinhEdNSq1XxL6BMlBFfKna3WjZf
 kfvCHvM/X05gLeRQArUQA7o=
X-Google-Smtp-Source: ABdhPJz42Js9k5rug/0miCJMNcXDdI6ZNO0wtdk4E/qGMYNflnq5GqOyczi8MiWzq5rYa/O924Nxug==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr15650338wry.407.1616778710531; 
 Fri, 26 Mar 2021 10:11:50 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id u4sm13945346wrm.24.2021.03.26.10.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 10:11:50 -0700 (PDT)
Subject: Re: VDSO ELF header
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Laurent Dufour <ldufour@linux.ibm.com>
References: <c45ae4f8-1cbc-c687-b6a2-9a431fafc85c@linux.ibm.com>
 <9366c258-127f-f105-abd1-6baa9a6745c5@csgroup.eu>
 <5b03e966-2cfd-5f0c-c48d-dea5e0001833@linux.ibm.com>
 <30c51951-332b-7aa8-13ba-44a0b6ae3498@linux.ibm.com>
 <87blb6gpkj.fsf@mpe.ellerman.id.au>
 <c7e0568f-786b-2c1c-fb6d-cd804bc1b539@csgroup.eu>
 <e8c2b4b5-f0b6-945e-4a42-c2308dd719a2@gmail.com>
 <3ce8811a-9216-6164-cdf2-974b13e400d3@csgroup.eu>
 <edf2547f-4705-764b-dadd-3ec1d2a6b8b3@gmail.com>
 <4904769a-be42-cdd2-1d97-8b1889f7f723@csgroup.eu>
From: Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <46e49770-04ee-2455-f2f7-b3915ceea38a@gmail.com>
Date: Fri, 26 Mar 2021 17:11:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4904769a-be42-cdd2-1d97-8b1889f7f723@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/21 5:07 PM, Christophe Leroy wrote:
> No, the problem is that user access has to be allowed for the flush()
> 
> A hacky solution would be to call user_access_begin() , will test that
> later

Yeah, cool.

Will it be fine if I send the vvar patch with your Tested-by?

Thanks,
            Dmitry
