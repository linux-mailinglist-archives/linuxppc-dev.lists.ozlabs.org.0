Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 238DD677606
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 09:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0jKW09c4z3c8x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 19:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ABfrupbu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ABfrupbu;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0jJb3W5nz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 19:02:54 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id q5so5282373wrv.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 00:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1Gxh+1vf6kqqu8QMgqF+ZuE7dNwAJOxaP/Fg9TsMVI=;
        b=ABfrupbuMKJ5qEZ20DIw5wuM+lYY2FXTw7ee7JerJvXbm8mdVsJQ/Le8r+mQIQx9r2
         y0FnMyAHQ9ksp5lMMroOFmp/ubrstkdqM1+gS2lSjfdPe7kfNrhdPB6OEalv4b48eruj
         bUJHtEbxrocnhwayzOyNo177BND9U7z65jstRIDM4C6u7M2igp0ILac1T+nfcAFPrEAk
         NbIK5GXQ4IvAC/rE82Hk541twkxoIsq3YKV6VpkYX7uezcfpT6Uvq2EHphrDdKOWla6R
         98dZguUw+SbkQWOVeIiQz/pWbNutbH6Yo3MrlV562+ImFu7NyrUdnzPXuzoZqqwdfZBY
         79ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1Gxh+1vf6kqqu8QMgqF+ZuE7dNwAJOxaP/Fg9TsMVI=;
        b=IDQd96AclhTpg2uBJImEWOQihq+Yv4W3330HTovmcRvySeg77o/asFs8q1ztyWPhPY
         Xn1A3NnoFZzySVt+OtEQe59dnVyPNDqM/AyjjNF7xyloyVQYPvXLW0aQNAO8awulqCpz
         S/KU4NPM/4Ji9p7KD4M19xBIiyAJNZEVG9ZWpkYibM3u1/gR15xOr9/W+ugUXHGFAY0J
         mSp0fcvTv9OTorURN7KBHmyirGvD42z3IT4xZwG5STMiFubO87qU90BaV6r/N5//w+lZ
         Bvq6/Eh/xlvVk5TygOYZm9jxNMP0r7h7RwV5TMqEwjtK6Q1RlyYST18iawOvXEY2n1U1
         95qA==
X-Gm-Message-State: AFqh2kombfcAtQtAVbLZXFnbR4JZAazRH/rBESDNngyN2fGK6sE0Fc0Q
	MqoOQ0PC+YUHIDpR5cop9Xw=
X-Google-Smtp-Source: AMrXdXvtVzd4wrInqjGZf8+t4ZCgLi7z3CMmu5lM22MHoDwkB+IefqFJI2CQnBOQIMb4RzHb1a9uKg==
X-Received: by 2002:a5d:56d1:0:b0:242:ac3:87f4 with SMTP id m17-20020a5d56d1000000b002420ac387f4mr19674169wrw.50.1674460970223;
        Mon, 23 Jan 2023 00:02:50 -0800 (PST)
Received: from [192.168.86.94] ([77.137.66.37])
        by smtp.gmail.com with ESMTPSA id m8-20020adfa3c8000000b00236545edc91sm3424033wrb.76.2023.01.23.00.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:02:49 -0800 (PST)
Message-ID: <4d26df97-3725-182b-6312-fa5cd8e9f85d@gmail.com>
Date: Mon, 23 Jan 2023 10:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.0
Subject: Re: [PATCH v6 2/5] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
Content-Language: en-US
From: Nadav Amit <nadav.amit@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-3-npiggin@gmail.com>
 <ee3844c0-b342-edc6-77cf-4cdc78e30a18@gmail.com>
In-Reply-To: <ee3844c0-b342-edc6-77cf-4cdc78e30a18@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/23/23 9:35 AM, Nadav Amit wrote:
>> +    if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
>> +        mmdrop(mm);
>> +    } else {
>> +        /*
>> +         * mmdrop_lazy_tlb must provide a full memory barrier, see the
>> +         * membarrier comment finish_task_switch which relies on this.
>> +         */
>> +        smp_mb();
>> +    }
>>   }
> 
> Considering the fact that mmdrop_lazy_tlb() replaced mmdrop() in various 
> locations in which smp_mb() was not required, this comment might be 
> confusing. IOW, for the cases in most cases where mmdrop_lazy_tlb() 
> replaced mmdrop(), this comment was irrelevant, and therefore it now 
> becomes confusing.
> 
> I am not sure the include the smp_mb() here instead of "open-coding" it 
> helps.
I think that I now understand why you do need the smp_mb() here, so 
ignore my comment.
