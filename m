Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 457818468BE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:00:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fj7fN0Me;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6981Gz9z3vXK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:00:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fj7fN0Me;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR6702gQqz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:58:20 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d7858a469aso13493615ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857097; x=1707461897; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeVnbjWEi5yI3wZCxJZ+3TFl6uPEJpXO65IAKcNUOWw=;
        b=fj7fN0Me5DwajOYhBJwjuBdaErlGi+IYPf6zKbKcXxkdaRv0/VDRjUpBwKw2k6pEo2
         XOkVWwP/de1ON5V1Ranid07s9D4LwHPmxSiRgCbcu8ohyWFeXK8TWGUtLUfKa+fLQOsL
         PjZhS92V0eZGtzdSo7frjspxzgn6yQW5rdBc4OGSTJHxIrbPi8C6JBYpw+uShDSKswKh
         eW3x/pTUaht5B4qoB1LTAbbX6+vRXlZ8w3/PGFMcmssNUeebHrvqInTCca+yn0QAlMMn
         IU8XB5Li47EaDqTUTF5f0ImCZq77Ww1Q1GWYMcB9SIYyJdPcH/PnmgWQclLvKPUohc6M
         yZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857097; x=1707461897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeVnbjWEi5yI3wZCxJZ+3TFl6uPEJpXO65IAKcNUOWw=;
        b=lgpfwQyZ/wUUkG+lkTAGbZqoY60VlFqgcqBm3UJpJak3dyrNBCOcBQRu9HVqte0Qp8
         QZWSPvpoC9K8zZ3VhENuVsY0YurW7/ouA0QqWFbn5AaSgG45hofZXLC89SA1PYbDdp0W
         eVgCq/E9pwcd6psHKna8Mv5N4S+hEwOvhuTQPS8rXnvfZMqTXk1kWodFYK1Ec7UROanm
         8ganqFjOKGijILLn0Z4OncP5gqxNOHswTZSaoL5DPntrlew4m77oplN3huTfL6AwnLl7
         G0NZfoOxscstzsR6mqczkxiEWp4FZiZAgMQ8uURqRTb2aVbChPUT1ZKvIKhDUqPtdNPZ
         j3sQ==
X-Gm-Message-State: AOJu0Yz5udl07xO1ySzjkJGppB1nqh2oChAt+CV8VEjnfB956fE2Hjvn
	8dcvK168hbV3uoO544L0kyt4m9OkepKagBUGUj4eN6bYVUiOOzJ3
X-Google-Smtp-Source: AGHT+IFBf6XLeyraYLqpgaXllqfIV8nP9aOkiHz9H9CBuCbU+/Yzwi3JwhbazRyvCR+MSQuAhK3haw==
X-Received: by 2002:a17:902:ce8c:b0:1d9:7412:834 with SMTP id f12-20020a170902ce8c00b001d974120834mr718546plg.8.1706857097435;
        Thu, 01 Feb 2024 22:58:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVJmtn1TofVQ50OkhQ3d7+h/hvpgY3hL3pMQR9S++DrXoJ95NmPFx5wFTv7bvP1p2/l1zKasGkK1rD+WWnzk0PdekgWWBoWRk4nYWS8BRvT70PElYjZom3Rl0qdTRjjdtOjns3331AdDSmEOawg0WnT2m8XyVQDQAYwn7JPuJP81H7+qD7eL00OM7eZO4aKstDvUSDy6kLbKV5SaTYhXjNv5bPHsj3fWPSZMsvPgE7p1uaxNJfAY2jceiXMTarske+gOQQArkw+uqLvSq5bWvZg6PEEwChSgxUg9SJlP/fYrh3NV4WAq/ldvN/DezZK9hI7K3zk9mqC3a8UEDoxSunAP8OzgOJRcpdqNwykqePnm3DAQ9tZlxD5vWC+kH4QwqVMQf3gFEGrrprsp4X7Ez5x6S4cT1HtvqoNHsrstfzGR8kDguZc6NNun+ggT2fufC+TbxJjBqqNBEr8AK5yEGxHSjNEFgJ1aqV8sTR/1zRNnen1Dio6xSdaw+FCJi3AIxME1Z58TikkJmw=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:58:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 2/9] arch-run: Clean up temporary files properly
Date: Fri,  2 Feb 2024 16:57:33 +1000
Message-ID: <20240202065740.68643-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Migration files weren't being removed when tests were interrupted.
This improves the situation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 scripts/arch-run.bash | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d0864360..f22ead6f 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -134,12 +134,14 @@ run_migration ()
 	qmp1=$(mktemp -u -t mig-helper-qmp1.XXXXXXXXXX)
 	qmp2=$(mktemp -u -t mig-helper-qmp2.XXXXXXXXXX)
 	fifo=$(mktemp -u -t mig-helper-fifo.XXXXXXXXXX)
+
+	# race here between file creation and trap
+	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
+	trap "rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}" RETURN EXIT
+
 	qmpout1=/dev/null
 	qmpout2=/dev/null
 
-	trap 'kill 0; exit 2' INT TERM
-	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
-
 	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
 		-mon chardev=mon1,mode=control | tee ${migout1} &
 	live_pid=`jobs -l %+ | grep "eval" | awk '{print$2}'`
@@ -211,8 +213,8 @@ run_panic ()
 
 	qmp=$(mktemp -u -t panic-qmp.XXXXXXXXXX)
 
-	trap 'kill 0; exit 2' INT TERM
-	trap 'rm -f ${qmp}' RETURN EXIT
+	trap "trap - TERM ; kill 0 ; exit 2" INT TERM
+	trap "rm -f ${qmp}" RETURN EXIT
 
 	# start VM stopped so we don't miss any events
 	eval "$@" -chardev socket,id=mon1,path=${qmp},server=on,wait=off \
-- 
2.42.0

