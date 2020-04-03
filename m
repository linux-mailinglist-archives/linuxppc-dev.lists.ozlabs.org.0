Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18119CE7C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 04:10:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tk0V5R0zzDrgL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 13:10:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DTr39Hi+; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tjyg63Z9zDrdc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 13:08:27 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id 142so2752972pgf.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 19:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=xg/PMX/hNgZ4HfTJhA1ld5BsEtZzgMebFGgTBw9D5rk=;
 b=DTr39Hi+y3EpXDCtEHd0mEYf6yHpP3w+Ke2aIvQZpAZaWVUO++n7XWAk+N+58J2aUe
 yfJVj0ges/jOuSqlzLVfGR65L91FyA2m7Ehz9az7g7SbV+BT5K//ImlJKOSkr6KBfCyJ
 WWPhrTX0DfLQBfB5vUCKUs+jfOGEHmn0tjGgnZK/vuIZirfVa5gOQk6zQnOVxfDxb93p
 eyBX43NdZurZdcy7/nBiZ76k1QJTdcVd4rD/EpvXusCl7CCMwr1US6Peq0yS04mjCB3/
 /HaU3gAjdPWf6+K0mufozvpLoZnM12r51JOJtO7tBAviDWdETDfrqZBVSTmsyG6nzY+g
 Icgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=xg/PMX/hNgZ4HfTJhA1ld5BsEtZzgMebFGgTBw9D5rk=;
 b=IyHuYaKRIn8HokQHRrn49QXNyuS94Oc8yQ7y5aHjw/QJf4St/0fCE8VTyf/FB6h3Uu
 gn5SyAzoNACQQinxlxWYlTxBdeEfLS0Wvfe4IHptfMiAdrWeRqRNJt3kVk6T/xrrJMWS
 dMhIXsioHhek56S4sF1YcC+ivB1x7scridiO2CHFXt3E5CkBpDP4Ua3tIf7hi87WmaHa
 csLfzgcMA9yNu1OdOMAQFdC7FdU30AruLXVhACHgaKomX+k5DQcaBHTmOaORI4avRG00
 8AiG1b6CCkfXvwQPAMMWpiVxecDiX7fNnvFQKAEWDOpX21rly4OmoJuRsNmw8ckNAmzR
 ACFA==
X-Gm-Message-State: AGi0Pua5cCWBDRr/gcO7G5DqZgYZwf7J/o5ccfjNuLcpFzwK2B5m83zm
 3nUOeLiz8nRXXWG0Fm9WW4c=
X-Google-Smtp-Source: APiQypKpVrCXuGSbTktFPCkucjABZ3DsRruN88UDdzdud9LPGBn6vxFo3ZtuUw2ylADsYmqP4jW7iA==
X-Received: by 2002:a62:14d7:: with SMTP id 206mr5759378pfu.43.1585879704474; 
 Thu, 02 Apr 2020 19:08:24 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id l1sm4623545pje.9.2020.04.02.19.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 19:08:23 -0700 (PDT)
Date: Fri, 03 Apr 2020 12:08:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/mce: Add MCE notification chain
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200330071219.12284-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20200330071219.12284-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585879413.ubv3w8ta2y.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: aneesh.kumar@linux.ibm.com, santosh@fossix.org, arbab@linux.ibm.com,
 mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar's on March 30, 2020 5:12 pm:
> From: Santosh S <santosh@fossix.org>
>=20
> Introduce notification chain which lets know about uncorrected memory
> errors(UE). This would help prospective users in pmem or nvdimm subsystem
> to track bad blocks for better handling of persistent memory allocations.
>=20
> Signed-off-by: Santosh S <santosh@fossix.org>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Do you have any such users yet? It would be good to refer to an example=20
user and give a brief description of what it does in its notifier.

> @@ -263,6 +277,7 @@ static void machine_process_ue_event(struct work_stru=
ct *work)
>  	while (__this_cpu_read(mce_ue_count) > 0) {
>  		index =3D __this_cpu_read(mce_ue_count) - 1;
>  		evt =3D this_cpu_ptr(&mce_ue_event_queue[index]);
> +		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);

Can we really use a blocking notifier here? I'm not sure that we can.

Thanks,
Nick
=
